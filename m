Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FD8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 10:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Di9qqZ1RzBz6j6pXG9aDCexw5rkW2pEbyvYej/E+knM=; b=EimpUJJKffjYNT
	7kwb6/slz/dXypp6nct3vj36h8SgpK1y+Y4G4oQzsjJA8RmlZ4u53/g8/i4pubk9N4u09xqN9eZrT
	EXWV64XaJEMpXnOWpk/86h6P8DnHUsBx6BlIkcy0xUDOSPPo1KJ/rWkSY/qVGMgSpCDY3Tl8EX4hd
	WXlQr28trKh7OFBQz3Dv85XFjKvPcQQZ6jFFDy0AP7TvBULCFLSXvELz2eERaPWX63bXta4z6QBU2
	BnLct8nfquhcBTvtg4gWLqqtqsrH0Wdm2XE19WqvhKbwlivTjvRjdhj7X3Bzo+NurG+fvMZelBKm8
	ml3FR5EfkOsBkN38WiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhU8Z-00D2TQ-3L; Thu, 21 Apr 2022 10:34:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhU8N-00D2Qh-PG; Thu, 21 Apr 2022 10:34:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C15801F4555C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650537238;
 bh=q3xCURJeXpVp7nXTJCMDC/WN0t4IsJySZXDpsN3C7X0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JYHXY+4kyEuJoN0AMOX+NtpU5S6jCDuV+XPuSgm27PF8iK8xudxwnOX7HEwfFy57c
 OMwZdgAup7zDOlpPequQYghojYp+y0oG2/2KhPTBsWho+ZvCXt6vjwRwTDR4a8OQQT
 ek9eV2tuehJONEA2uqcZ1yVSRa1wERiqTwRzfscdg118C7AdEZ8Rn0b625UIEpzqHD
 mXSIE3BTVPIA2tWEWcaYvhN547qRKZAFrQmXdyyz+QUbx1hE8VbHvHCOzzlS1FKKuF
 RX9D9JmXSAJMl7zykR7U+pKPTuWzUk256nQ/HZckGxx01hTamu+UrHy7k0Y7wDbq3x
 Po4CS2CqJlAog==
Message-ID: <068165d5-6c25-2a65-0191-957b6b1d0680@collabora.com>
Date: Thu, 21 Apr 2022 12:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 7/7] arm64: dts: mediatek: mt6359: add node for PMIC keys
 support
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220415153629.1817202-1-fparent@baylibre.com>
 <20220415153629.1817202-8-fparent@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415153629.1817202-8-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_033400_011047_474D15B9 
X-CRM114-Status: UNSURE (   8.98  )
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

Il 15/04/22 17:36, Fabien Parent ha scritto:
> Add node for the MT6359 PMIC keyboard in mt6359.dtsi.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Hello Fabien,
I agree that all MT6359 PMICs do support pmic-keys, but not all devices using
this PMIC have physical keys connected to that.

Besides, even if all of them did, it wouldn't be guaranteed that key-0 would be
always KEY_POWER, as much as it wouldn't be guaranteed that key-1 would be always
KEY_HOME.

In my opinion, it *is* correct to add mediatek,mt6359-keys to the PMIC dtsi, but
you should do that without declaring any key, hence it's enough to do:

		mt6359_keys: mtk-pmic-keys {
			compatible = "mediatek,mt6359-keys";
		};

... then, any machine that *actually does* have these keys connected and manageable
in Linux should declare its own keys in its own dts/dtsi.

Of course, this means that you'll have to remove your input.h inclusion as well.

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
