Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2CFC38A02
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYKHdFM//CoplzP+MAaQQIKGifnnpHY6F2VAGllHOYc=; b=wWDGk7xBnIdeKoPVRNyJwiuyyE
	LbP1c3azwmfiC+msj2UBJYNmTnOLq7oiLJc9y8hwY15kd87BgNdQoYes56oKXwEps09KiBqwKGM+3
	oaJuv6RPHrVTTCHCRw0b2abiVxCccyRZVVFLyj0Nye7yZOjtWi5IBVBLpC+m3ogJGEqBDOKAM5wKT
	nvg0Ui0zec9hIBPpZdfcIEiHGq7ZWajHQwQBBo/ACR6t3xO14sR1yV2H8GJrD+A5IzUMZCoCwU7Li
	fw/Q1X/FSz2+MDAvS4tbpmDVViGCi5jmAArhfXoLOJv939LsdYGIhsmL6PSO7wuySaT+JV/fVEgkR
	/UAePbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op79P-00FrTh-Mt; Sun, 30 Oct 2022 12:10:51 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op79E-00FrP4-S4; Sun, 30 Oct 2022 12:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667131823;
	bh=jYKHdFM//CoplzP+MAaQQIKGifnnpHY6F2VAGllHOYc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ScZoQITzgWswo3rkAR/F6fj/7vEnvxc4/0cN4zb2FgrW/CONIZmI+wTrDy8ZldSqA
	 9MWDdT6gvfM4FJC/KUIrL80dnyFVeahrc5Aj0Neq7i0UvajQhs82G2MVxJXgwHEeTt
	 iLhTgigxi5jv8hFemxiP6p+LrZ0/iZZu9qdyNk5tFlGo2ndFzX+InnULTW/qT31pry
	 JgLYYDRPQa67eUEUj3jgQYRTWEYl1aRn/YyLKxzzwwymSLHWCJrf9UHj4BWdCEGBmE
	 aEv089OfJoEM94/+RL1B1X01cUEZaJvEwFMyuzKwzW27TA/HJIf/lRrWHPQtMkbH/j
	 QqSwOl804Ef0A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.74.95] ([80.245.74.95]) by web-mail.gmx.net
 (3c-app-gmx-bap19.server.lan [172.19.172.89]) (via HTTP); Sun, 30 Oct 2022
 13:10:23 +0100
MIME-Version: 1.0
Message-ID: <trinity-f841c7eb-f228-4056-9d04-fd79b49b23dc-1667131823778@3c-app-gmx-bap19>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Aw: [PATCH v3 2/2] dt-bindings: PCI: mediatek-gen3: add support for
 mt7986
Content-Type: text/plain; charset=UTF-8
Date: Sun, 30 Oct 2022 13:10:23 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221029175806.14899-3-frank-w@public-files.de>
References: <20221029175806.14899-1-frank-w@public-files.de>
 <20221029175806.14899-3-frank-w@public-files.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:U1xs1lPpFVVoC9XGOOvCRggbEUpzED+LtWFYBjROwPMvcHLzpncsqe68I29hKPi6Ds8v1
 e3ZwZ75IY96yLg0hWDeCc6jIVLZi/Cd2VSdrmbs6MQl1zskz25TE4tSyB4MtlLWwYjfiLQw5gI1G
 7ymr7j09/C9lxuzxk2g9f0DiDXk6XsRpSM7vRjBs4d/ElGBguErvEwnvnlFz798NIrhPs+d8pH5O
 PGCMmeOyanyVyXDgyHX942W5t8GTEoEJsx/c1DZKyca19l8pvFeEK/bnTz/3B6SEga/w8jDPxFs9
 Yo=
UI-OutboundReport: notjunk:1;M01:P0:CvSn2UOjMJo=;9PYRb0TSHf7FX0WCiZ3RpJWdfgf
 Qo7202cC11UqG2ED7DpMWwIUdv3Nhmx+ONHdoxAFI1kzBembJ/UYTQ/w4oQeW2cP7FQry7YsD
 OitR0/jU9+AmSFwxiP7ZvgNx6uiTQMsIpD6gC+1X5NGOBg2giqcHPKN14Hrn3cipHoTV4F6U0
 L5qf4rDaRjFYzmxZKSr/+cdJ4fDFW48sdDxrRAHpculFgxwMZRFe66xFd5sEBEJmBxgx/YXyg
 LErjF1azPzllBRBeBuqTYYtPzNRi41CA8y4TMeulZJQhCBO2NL6AjifpkL3BbOPOZlI83AhnF
 EH6rXJBVsgdJ7nryU8N2tr7F6hqC/XZHduOBvCdQQgmQWEfvVcWBYIrOS9KVKK9skTn/5vivY
 GPn1zxyxCQD8/wEy1nwvoS9pd2Hz2KSiqcxdhVMrRu2IcPmFcFTVN1Qrv15YUN06YJf8jH2at
 RWooTYLat7r4p8IXieEh1fe1kbapJsBtSOf/BuFpv/8sTST8oRLzk0yVO8hAP7k7iiHldvquJ
 RGbgolHDQQPXr+0YtHuMRffzo0Cw//hG/zuMAYtwl686/qDVsp6dwu+xO/ZCpZYAMyNRhOh0u
 zL6Z4rr+zPnz3KymXT/6qCskjlKi/sMLGLkyHhwWXkrGhOBxHwraWgjfSV23Wo0eNGOmzx7tT
 2bHtxiEyLvNgm2H2EAP5IfRilJnQqBP+CpJXX3AKV5dETYsauSomQZDooVjmZnsp9yF8mGti8
 qQg76zoHEGRI0kcGMrFCW52/8qyviJPVILPsHvVGbSfokussiKODTkF3d5FfARZdy7kf/cTU9
 MLydXkfeVaEzSx/55z0o7+Yw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_051041_214086_F5F4810B 
X-CRM114-Status: UNSURE (   5.98  )
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

Hi,

sorry missed Reviewed-By from Rob i got for v2 [1] (this patch has not changed, only part 1)

Reviewed-by: Rob Herring <robh@kernel.org>

regards Frank

https://patchwork.kernel.org/project/linux-mediatek/patch/20221025072837.16591-3-linux@fw-web.de/

