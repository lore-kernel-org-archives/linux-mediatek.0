Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F41C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 06:39:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76D56105A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 06:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A76D56105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ya.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AdD0ka2MHuuJHxDttykTHAxQgf6SByMRYbeovO0uwwQ=; b=DjObJqLNGBn2P8
	h9Rl7YEQaHaQBEaP1d8hbXFsRXjmZF2crzRcnqOooe7rPkSGRlgzu7G4bbPjadfkH/wcCGJN2UYeV
	8F33fdPdM1nP/ARPKe4hwGasPVSCN9nOKnIqo3/2BVAT7CA/x8AUroVOMifwAwBORbF/EDkdxlBDQ
	OukE9V0yiUPu9l6BiBQykCxNA6czal1RaiSz42NORX3Ef1vVyyj9L7qneZ7vOIRsU8c1mrI9j8at1
	XK2lFy9A2U0wy0oUIfUQHq9WrWYxdbfGWd1Dhs5EKy9FIlrr8bZ3Z/V7XY+FJcb8bv+aAZlyvWF1p
	V8+irl8dpzZy34ojm1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTIOQ-00AOpE-C0; Thu, 23 Sep 2021 06:39:38 +0000
Received: from forward108p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:116])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mTIOJ-00AOnl-UI
 for linux-mediatek@lists.infradead.org; Thu, 23 Sep 2021 06:39:36 +0000
Received: from sas1-52393d83e2f3.qloud-c.yandex.net
 (sas1-52393d83e2f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd22:0:640:5239:3d83])
 by forward108p.mail.yandex.net (Yandex) with ESMTP id 70CC82676FBE
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Sep 2021 09:39:18 +0300 (MSK)
Received: from sas1-e00c2743cdb8.qloud-c.yandex.net
 (sas1-e00c2743cdb8.qloud-c.yandex.net [2a02:6b8:c14:3a22:0:640:e00c:2743])
 by sas1-52393d83e2f3.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 us7NPrhhK7-dIDunxsu; Thu, 23 Sep 2021 09:39:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1632379158; bh=p/2ARZ46TWFPwNrwbyVP+XUQ1rp1EsuD4WpflrG0ul4=;
 h=Date:Message-ID:Subject:From:To;
 b=Iiz4WRekDGdIk4KFYxb+agyhfiSNmKhRVJBtqDCH0ouZNpzveDxWG5J8/G7eIwFLg
 Lfv9+YoUSq2vjJu2s+fwjqGNmjrCBfEXrg7pF+GXJ8ohIendVIXYioPgMQcsiK4p7F
 EDxszTDOAdl2D3NfJ1xRdk6pkAW+DGYGR+MmPbQo=
Authentication-Results: sas1-52393d83e2f3.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by sas1-e00c2743cdb8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 43Jk957GO5-dIR4ui0x; Thu, 23 Sep 2021 09:39:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
To: linux-mediatek@lists.infradead.org
From: dukzcry@ya.ru
Subject: No AP mode for MT7921
Message-ID: <fff7cbf5-4b53-b588-4a2d-74f3c5351a87@yandex.ru>
Date: Thu, 23 Sep 2021 09:39:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_233932_350633_A22B42D9 
X-CRM114-Status: UNSURE (   6.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello.

Are there any plans to implement Access Point mode for MT7921?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
