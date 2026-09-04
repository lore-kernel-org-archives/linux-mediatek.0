Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D5C624DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:MIME-Version:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKjGjHVhhR0zV1iEtU14nKVo2m/Fb9LFzj83DSGM/p0=; b=dk7IJsob9nEPltl+ZBZ73vB8o3
	ZY57EXMbJQvb/hv+NVQKp3BrQmr7nySxtcBfDEnS8I+o0U9vn8tevreQhxkb9AqPbyFRTMtXeXKVO
	aj1YegpZCxS/pogtPxWglqZ8o+8K6VR3wlJq5hY8r4mUDyEab03YVUUBy8dnJm79ogppCbV5n9xFj
	Ajrva1lGMWPoAgvH23pNTIiA/DrEnruRNVdODZ3sKg6YfGHX+1818hI1brfknvUlnTXEWrijccsHi
	5q2MyiY9zRhJRBg1PD3F1rxcOhdQANCT6FyNiZNdfDJnS982gvjoGQbQjYdtrHSlg2Cj2mQKn80kC
	XywMPEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WVv-00000002gQ1-3ftK;
	Fri, 04 Sep 2026 16:11:39 +0000
Received: from forward500a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d500])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WVs-00000002gPg-3DWs
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 16:11:38 +0000
Received: from mail-nwsmtp-mxback-production-main-72.iva.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-72.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:2923:0:640:6b94:0])
	by forward500a.mail.yandex.net (postfix) with ESMTPS id 41D76C15CC;
	Fri, 04 Sep 2026 19:11:30 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0c:862a:0:640:6de3:0 [2a02:6b8:c0c:862a:0:640:6de3:0])
	by mail-nwsmtp-mxback-production-main-72.iva.yp-c.yandex.net (mxback) with HTTPS id 6BMMDbfoSqM0-VSMVhZy6;
	Fri, 04 Sep 2026 19:11:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1788538289; bh=WKjGjHVhhR0zV1iEtU14nKVo2m/Fb9LFzj83DSGM/p0=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=TECirj0BsqNNon0b2M4Ksr7nkXiXGVE6iqFokkZl+q9uMhLGaMEUDWSsAx6dg2wXa
	 TU280AN6g33YMAarMRIwqDDiUGh0N4uB2HEOUBNnMVukABh0COgcD2CkxfsZ8fLIt+
	 fU74hcEHMutdgbNjzM3OSm87YQbpnJGMPBDf3A8o=
Authentication-Results: mail-nwsmtp-mxback-production-main-72.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Received: by mail-sendbernar-production-main-86.iva.yp-c.yandex.net (sendbernar) with HTTPS id ee0435dc52cae3934b01e0ae2982ece3;
	Fri, 04 Sep 2026 19:11:29 +0300
From: Ilya K <me@0upti.me>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
In-Reply-To: <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com>
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd> <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com>
Subject: Re: [bug] Triple whammy of mt7996e bugs on 7.2+
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 04 Sep 2026 19:11:29 +0300
Message-Id: <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091137_186466_EC8B98A3 
X-CRM114-Status: UNSURE (   4.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> https://github.com/greearb/linux-ct-7.2
Hoo boy that's a lot of patches. Anything specific in there, or do you want me to just rebase my changes on that entire branch? I can try, I guess, but probably not today...

