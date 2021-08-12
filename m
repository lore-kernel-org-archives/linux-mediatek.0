Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FFAC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 21:07:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6921B60E52
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 21:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6921B60E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67DUYhCPKaHP7hTH0J72Pk8Uef29WsUZAiFJu/PXIpQ=; b=4aUjp5XHaoKJSA
	wBW1IoT/+AHtfWJps2JP8hvVAslkV1xNtwTB/RQQJR5bjmM+fHWll1ato+aCw6JUG3dfpIAzc3s9N
	Cfjk/XSx6ix+4VmMHCVYayL1pS9N74DgEXPdkaXPKcpxBrfs1Xo9fHzgQqyCpCQAW2qp9DlYgJAFi
	a3UWF5tgD45VudiLUG6twaSKUG2JJBphBvEp6KhLFU/t4nemwcRkjs7i+evDFpHSKjAugsdZSStn5
	7gadJ9tyqzd7FRNCFQ7lpO0Kf2WyZXy1zsqwzsxKPX470r4jnpb1maUPhDPkQlWSjFZkFkp6DxdZf
	zO6r5jbSFMcLUUcBESRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHv7-00BJqX-LB; Thu, 12 Aug 2021 21:07:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHtp-00BJVV-NS; Thu, 12 Aug 2021 21:06:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F401B6101E;
 Thu, 12 Aug 2021 21:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802361;
 bh=xxKg3QKtgOFfe3J4sDO6Rigeg11oPtnhlnbs8G71jss=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jwjflFxFCYdVW/oDzDtLYVnwiUN9AuCfIcuhRI8XnLAfDTC2TCokn9CAWvP4X2kXE
 p3z+yRjUo6GFuGpxl7Sq7Tgh0cQQi/GIbjZ+ISq64X0ufOIiACS+UaJPoECMbTCELo
 V6uLl5cuiPMzWkKA/yy3ev2OLcKgjeJ9irbu7mvZApWw1hCFXCZCKs84JK+e8AvEeC
 Z1CvpwFzFPHNxV9sdDzO1OdHMG5WapmKh4qs2iu57BhzMnDS5h7iM2TVWPrIZ0vwOT
 zGfkDJ0/YDGrF1XhKXg7sWOyGA7Q5Rb39f3ldJ1n0yHSpqt3pGcNqZjpPz/BLipF0H
 70k626ap8jydQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [GIT PULL] ARM: dts32 updates for v5.15
Date: Thu, 12 Aug 2021 23:05:40 +0200
Message-Id: <162880206129.1376011.4763501085198621615.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <289ded1c-dae7-54ef-6b56-9433bfcaf9de@gmail.com>
References: <289ded1c-dae7-54ef-6b56-9433bfcaf9de@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_140601_806068_C7D337E6 
X-CRM114-Status: UNSURE (   7.80  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 14:20:03 +0200, Matthias Brugger wrote:
> Please have a look on the single patch in this pull request for arm32 MediaTek.
> 
> Thanks,
> Matthias

Merged into arm/dt, thanks!

merge commit: eaf05c1fdc14ed04a47c8632db5ed45010fccd09

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
