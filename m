Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C381C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 03:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31F4615E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 03:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F31F4615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=765Gy1GH9Bwrqztb0vAfgI//KmDAMHS0qR7OLypsmvs=; b=wEQDGEXWZjR+U1
	wboZsC5HAHkAqW1iN+cfWf8chZTnj3SfrDOmKU5M/H+PypkhnaRh+h5AvsbYAok09hJXdaGIK7i1v
	tPJap9rJfk5cyudLa91SS0tDGEn7E4G0PMueDyRSV2Ie0BqRmd+81VC0A4klrJ0uNDRcQ8BNVvATM
	NEuYv+xSOgA04ZYgRcjPhIVczDasVsdOTGKrvb0LU+eliKb9SXP3O53+F5a8lVGquOUfMaqnIFia5
	gZO65FsfD5B99ds22SwEsW3ai6rTBJZdmqdPeNwn9czSUHqbooEFblaoyvIrrqc7+BEsEeOLDCs0Y
	jNmW8Qz1HD85im877ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnBjN-003CIn-G4; Wed, 17 Nov 2021 03:35:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnBit-003CAW-60; Wed, 17 Nov 2021 03:35:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AD32615E1;
 Wed, 17 Nov 2021 03:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637120097;
 bh=VUmTIC5BCyZ67w3qyjsYJF8UTcuEeggLjE43jAsZRD8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TpRtqW9K38XsKt2Jsswp3oGgIz8moVJ/FoKwYK6BnhVVFh5py0AAmx2OAXafjgYTF
 i2hnSzbu0NpUAewcSc+kqOn7J4v6gG4/zOuxi6De07zFSYGlkg/twBCmzBbe1sVUcF
 U8G8C10a45A2SFCkrMpb+2F0AQjuor8eBaEraNyT+o21Bv4Bj8tMj3ODKrnGz9OWYJ
 TYUH1k8z0zftZikYRj6KjSEkLV8GnygVyMNjSmcGIXJCd/P+VdSJo5rrkFf9Y06teK
 bArTFlLdREii0nzt/Bt5eXvgTWpIUFNVRrnUnUcLKr20O4jpoW/AYJ1PuM4oMUNQed
 aRDdVCxM4C8MQ==
Date: Tue, 16 Nov 2021 19:34:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: David Ahern <dsahern@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rocco.Yue@gmail.com,
 chao.song@mediatek.com, yanjie.jiang@mediatek.com,
 kuohong.wang@mediatek.com, zhuoliang.zhang@mediatek.com,
 lorenzo@google.com, maze@google.com, markzzzsmith@gmail.com
Subject: Re: [PATCH net-next v2] ipv6: don't generate link-local addr in
 random or privacy mode
Message-ID: <20211116193456.54436652@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <14eee606-427b-e0e4-abe2-de4e166c1585@gmail.com>
References: <20211116060959.32746-1-rocco.yue@mediatek.com>
 <14eee606-427b-e0e4-abe2-de4e166c1585@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_193459_296658_547F3DF9 
X-CRM114-Status: UNSURE (   6.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 16 Nov 2021 13:21:12 -0700 David Ahern wrote:
> Reviewed-by: David Ahern <dsahern@kernel.org>
> 
> you should add tests under tools/testing/selftests/net.

Please keep David's review tag and repost with a selftest.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
