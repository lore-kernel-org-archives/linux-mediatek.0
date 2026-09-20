Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0F5C982E1
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:MIME-Version:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggDXQml+3AwD7Hw47o9K814Vwfhlxh4e7ksLSjlixVU=; b=rAcYPQPgHuiVM+qexBpTF5eT/+
	bHR5vncTik5+pgTD1zwD+FCi64gLV/sQC37FX9uJk2Ei2wywJl0ovxVTOI0k+7aBjNh23l3d92L2p
	b46b35ec983A5CUl89lMOU5wgILeVqBVJmXmHfKmpAALH8MEN858kcWtyghxErKj6Xu8cOce4zgEA
	hHgrHtmk8nU9rBgie+htps/5vvX3O8DwZSs1BeOBHsaF03dwshIWnmGfaj4Cpnthz7k/Pkq3WJWdD
	50niPIzbXr38/Hq+zKqh8zCbXCnMa+oSMEehPwmKuODR7Z4hT0my/7jCxdIcB9fAuKGVlGdFeXv2m
	r5oYsOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ICx-0000000HZ2P-3FI5;
	Sun, 20 Sep 2026 14:07:55 +0000
Received: from forward500a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d500])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ICu-0000000HZ1q-2xOc
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 14:07:54 +0000
Received: from mail-nwsmtp-mxback-production-main-82.vla.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-82.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:2f23:0:640:4f85:0])
	by forward500a.mail.yandex.net (postfix) with ESMTPS id BFF46C1223;
	Sun, 20 Sep 2026 17:07:42 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0f:691:0:640:b58d:0 [2a02:6b8:c0f:691:0:640:b58d:0])
	by mail-nwsmtp-mxback-production-main-82.vla.yp-c.yandex.net (mxback) with HTTPS id P7aE5u3vjqM0-cwncLNUX;
	Sun, 20 Sep 2026 17:07:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1789913262; bh=ggDXQml+3AwD7Hw47o9K814Vwfhlxh4e7ksLSjlixVU=;
	h=Message-Id:References:Date:Cc:Subject:In-Reply-To:To:From;
	b=NyPvplGOMOwkBXds1ghR95s9Ac8MUST3/qRWYMh0Mdj+iT1neDTJMcdEyI3ZMXqyl
	 rx9WVDOTmc/21jq1ueGcxN0dX3MZ4/gexGtT5EqPoGBvmvB3zC+Yik+Pnzz8ou0pYc
	 jEdmGGDpiEPNicpPhOgBO5sttUTu6Ii5TcoHcr7c=
Authentication-Results: mail-nwsmtp-mxback-production-main-82.vla.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Received: by mail-sendbernar-production-main-46.vla.yp-c.yandex.net (sendbernar) with HTTPS id 26bebf9f2deb4af9870c5891ce14b963;
	Sun, 20 Sep 2026 17:07:41 +0300
From: Ilya K <me@0upti.me>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
In-Reply-To: <1443771789748846@4a8ec5ae-80ed-44bc-b7d3-6bc660c90136>
References: <1767631788532094@64c4e675-cd08-4a74-816f-886742f9bfcd> <529a79bc-dab7-aa41-00bd-c47ecbefaa00@candelatech.com> <471221788538289@323ca970-5bd2-4c6b-b52d-2b863a718615> <3acf531c-bcc7-412b-b3bb-665069260e46@candelatech.com> <2028561788553569@f088f4ec-f441-47a1-b7e4-75a1052aa4df> <2418461788691106@84aa39c5-f501-4e64-8418-6a8b6eb88e21> <eb405366-6574-4e4c-a89d-363751ed848b@candelatech.com> <4175721788798939@f00554c7-d809-471c-9bcf-78e5d8eceab4> <1556871789207706@7dc9deb3-4292-4932-8568-de9b411208d8> <1443771789748846@4a8ec5ae-80ed-44bc-b7d3-6bc660c90136>
Subject: Re:[bug] Triple whammy of mt7996e bugs on 7.2+
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sun, 20 Sep 2026 17:07:41 +0300
Message-Id: <211851789913261@df1900ea-d467-4ed7-a7f1-de68a4c3e6dd>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_070752_948261_AD691C41 
X-CRM114-Status: UNSURE (   4.18  )
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

> I've picked a few more things from the latest mt76-fixes, specifically these three:
> - https://lore.kernel.org/all/20260729173632.14387-3-enderaoelyther@gmail.com/
> - https://lore.kernel.org/all/20260823053739.186748-1-gongtao0607@gmail.com/
> - https://lore.kernel.org/all/20260901092232.461379-1-nbd@nbd.name/

Aaaand it crashed :( I guess I'm officially out of ideas now. Might have to rebase Ben's tree again, but not today...

