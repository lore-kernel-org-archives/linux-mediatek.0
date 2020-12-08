Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61064C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 23:13:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1765B23B19
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 23:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1765B23B19
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pgQ7GtcVk6KsIUW32y6fALcd4mco5RUM0JKDIcLQHa8=; b=DgqLKYct1AhnjIIhcZNc0M5/x
	jRpgpUw8kLXBZ69AcJw/txUCawqct4MD2b7BCuENyIwoicW8nLP+0EIwb5sgbxZ1ug1aJ9tB9fGki
	AELtSe4p3RMlLsXrvFtwP+V+VH1l6FhLi8J241q6TvYcyhk+v4RUb8+imhA9b+egg1zQuNeKAg6FM
	1LYNXnxF300x4ouW5keHHvsy9cKQ7bWhFDGxex0+ieAyk+Et5G6gOOtrmgmiiu4dEkhFGRo9ptUxp
	SSAb44X8QM+3KQQeX5Pdvp1Yd3FMuVLgK23OdNT555k1B4n15WBHZGaWFrGgxAbljJZ3UVFJY7aDF
	3ythFueaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmmAd-00072O-Ld; Tue, 08 Dec 2020 23:13:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm8L-0005hT-54; Tue, 08 Dec 2020 23:11:02 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL] arm64: mediatek: devicetree changes for v5.11
Date: Wed,  9 Dec 2020 00:09:50 +0100
Message-Id: <160746884493.2839681.12401038433447118676.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <72fe1c4f-f27c-c455-dfd9-66bde90bb295@gmail.com>
References: <72fe1c4f-f27c-c455-dfd9-66bde90bb295@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181101_362886_D8980BA6 
X-CRM114-Status: GOOD (  11.39  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Seiya Wang <seiya.wang@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 29 Nov 2020 22:16:11 +0100, Matthias Brugger wrote:
> Please have a look at the following devicetree changes for v5.11.
> 
> The most remarkable changes are support for three (!) new MediaTek boards, the
> AiOT chip mt8167, the smart phone chip mt6779 and the tablet/laptop chip mt8192.

Very happy to see the mt8192 get merged, looking forward to seeing actual
Chromebooks with that one ;-)
 
> Beware that I had to create a stable branch to share the binding includes for
> the new power domain driver found on mt8183 and mt8192.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 5161540797589eacad9b309416b1d15729306c00

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
