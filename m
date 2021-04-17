Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFA8C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 00:04:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705BF6115B
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 00:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 705BF6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Q4qYHBf6xKR0bWBN4pDi2t1qet0SwmbG0Ne2gVpy0o=; b=G5sGWakhJ4tbFu8oFXHAG7p5+
	Ith64B0lg7EN21vh2nZYVgF7ocN3giN2JotawzvaO5PSXo0vcLbdmPBOxv6hJTSdkfGvYGSE65dmR
	7nC7LogE2quSAP4HJMU0sSirkryXX3nH4T43tGy6HlSjhwg3i8D6rxhoMNxSbsp9a0D9UN4cGNAA6
	SdaC33FHq/QgmC2j6dcQWdxlmDlymwz9+EZ1fG4q4HHqUBByw9H7keA97zS1La2svKwGahnzxzBU1
	iaurXsN3dXlUyP2/Q4xGeg2tDHCSzcZfAmqV8VeY3u0of91IEv+Zt+d5lpagGfozTyVY4NDW4kE6w
	3e4sZClyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXYRA-003nrl-TO; Sat, 17 Apr 2021 00:03:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXYPx-003ngQ-0A; Sat, 17 Apr 2021 00:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:Date:To:Cc:From:Subject:
 References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=DtcwCnU2bWW7YUiEpToRNpS8Pj+rL/i63TmoUofqz/U=; b=cGczZy2nXzASILijcDN05bxxbu
 /ZqrItDUKBIHRPYQ0TspcbXtCgkgoQh2NXIasaDaX54SMGosvkU+MK+FJpl5M3fFBx0eWQ1XBY4mX
 sRUCf6BURftid1Juhw3rO0FrkMKkh9DQeSdR2YQ2J81SieGxNoKkFsbpAcqgEtQRyDagB40fPrrki
 SEJ+9ZcYneXra+jZVEvZP9QSassRQ6miZVrTBE/eauljW4E783OTrtVyOoC+pYbdDaSwNfzKE7XIu
 gJrS9b1f88K7Wiszf1RkGKfjNHtaLD5xNq152yAijjbKe+kl3XTVWUmry+QjtV4atDDGOWePEPQo4
 oQHK3wmg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXYPu-009nRC-Jg; Sat, 17 Apr 2021 00:02:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34ED16115B;
 Sat, 17 Apr 2021 00:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618617750;
 bh=DtcwCnU2bWW7YUiEpToRNpS8Pj+rL/i63TmoUofqz/U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=U5R7ieKowAxOZ1uBJMN29kk5OedkpQK9mq7fVSM5HWqUCC77yYbQDfBOek+czQoBZ
 4yTd9KUG7O64FLXx/A1iJTZIHYjM2LLXrWzp7ezL6WvNWMQzngBekYCyap3PbVcfAp
 p/e73gnauEPsq/frvYBAvpYyFVEu49YCBeck+Rl9eE1dpSWvYb0FEprPJuC9fvvai/
 F3B8XYg3ZDPjgoLKxxbrubOI2xQDoqsoxbTPmpBJqFVj0vXzJsaRfOmM2fYigYnjFY
 ihRSK9tLYr0Qh1N0VDf9rdq5CDxoU5LGJzbUnlSyXcuu7BmimRosNuSDezD+SkGonr
 7phRPdxu7cD7g==
MIME-Version: 1.0
In-Reply-To: <1618465960-3013-2-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
 <1618465960-3013-2-git-send-email-flora.fu@mediatek.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Add MT8192 APU clock bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
 Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 srv_heupstream@mediatek.com
To: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 16 Apr 2021 17:02:29 -0700
Message-ID: <161861774904.46595.8483541757848028552@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_170230_687015_AE0AE2EC 
X-CRM114-Status: UNSURE (   5.45  )
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

Quoting Flora Fu (2021-04-14 22:52:34)
> Add clock bindings for APU on MT8192.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
