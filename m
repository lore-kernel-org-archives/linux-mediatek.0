Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE5CD1296
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AS/CHdPwbHyPSm+pPdnBJDUIVHUINkED2O+KNOimF1k=; b=MQXm7226ySqrm4Bk51YShHzWO6
	O7SIein0D6ilC40wRR+MeVmWiOsTGElSpVhRWzt08NcQhtPBwRtVvJshb7jc9udu8oAL1bSjY7GKA
	fjYpe++RgNQxTDEUr2l5UMmGIcK8ZqioiFJEZ02gjztgAfAhm3EhYFl3KLdxidEQF7AoVjdFJti50
	B/Fjhff0RQat7AJgqYc8EM+Dk0vjGIhcC3izZukF1nFLLM4smmHTZPA6ITDkSuXsnOye2r71sNHGL
	YH2JHFBNijGwqlCrEg6c2L/fN3upjHZG1TPEdLX17hpHBBSC/K3Xi725+hwyEroo4fa8vagwREBoh
	r15Em3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseXF-00000005qfw-2nhQ;
	Fri, 05 Apr 2024 08:02:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseWx-00000005qS7-2fv0;
	Fri, 05 Apr 2024 08:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712304154;
	bh=M3yAVxJTT1w5cqJys+gZWTSh5yMgC3YJ8GXKlzaEoKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E9QpCMx6LNrGeWeT/oPVfXLsHesBSdx2uoJQ5xPUS2d7BlscvppUCGaHxSA7jxYK1
	 C5VBcYvLE3pOrrfGhZWaWUujWvfN6ALpGryeEZJkK19JI5+8UQqE3Rt79axp5XjTLu
	 7BHnDTaBPn8sprbd03gctIvWDjV5Zt2NPv0+8nwEBYlexdpdrD+cIZn7nhhuZXzg2j
	 21ya0d6A/LJfPgQL03fwLUHhj+cIoyn2Q1DNT1mXRViPzl8uMD6ydzSial8662ZqqR
	 fwamxFyGGFvNKptYS2PDx+rd5IoLDp2g7vUEga/Y7bz791sio4BFU0Uuj2nbCmxBFu
	 8JBZpszG4/FcA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 49EDB378212E;
	Fri,  5 Apr 2024 08:02:33 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981: add watchdog & WiFi controllers
Date: Fri,  5 Apr 2024 10:02:26 +0200
Message-ID: <171230395357.52952.9902355743801356290.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240221085547.27840-1-zajec5@gmail.com>
References: <20240221085547.27840-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_010236_333293_15D74118 
X-CRM114-Status: UNSURE (   7.31  )
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

On Wed, 21 Feb 2024 09:55:47 +0100, Rafał Miłecki wrote:
> MT7981 (Filogic 820) is a low cost version of MT7986 (Filogic 830) with
> the same watchdog controller. It also comes with on-SoC 802.11ax
> wireless.
> 
> 

Applied to v6.9-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7981: add watchdog & WiFi controllers
      commit: 452f39543ce4cebda3471931b0efc6a46e765458

Cheers,
Angelo


