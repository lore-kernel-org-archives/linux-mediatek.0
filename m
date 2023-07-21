Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4035EB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNGOKMPJQA6OkZXDG6zJv5KmPjcYrJF+z912/uDjb6I=; b=IFggdIgQaqjpRD9QIBa6jq6xdC
	nmDBs+qy/UY8vcrGtWelbgBJKGSPQmPnCOw2vlN40UXdH9SwWAyXciqXN1aj/nbEyWJn3D9Fc+iWk
	SJRll8LOgtRIzrNirRJrabrpWy+nyAh1s5mdauKF5MUHcgsljQ8Paqi20FrNBSiUZycRBADUgrPxL
	hjDtxgiJCJuOFRKbmRm+FKyGWdIAZNQeHu3VuKQdo6cTRtk0zTJqVeInqBLpuYCXulfOAf+vjJvbh
	eRHdx25ReMhbY4qnT5fw93TR0QynSzcyF2Any8dT1PlfltutztZRTobx0MVTnQuQK33kYdndqg5ca
	F9agJ4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrFj-00EIrx-2S;
	Fri, 21 Jul 2023 14:37:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrFg-00EIqu-2F;
	Fri, 21 Jul 2023 14:37:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A117161CD7;
	Fri, 21 Jul 2023 14:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7671FC433C7;
	Fri, 21 Jul 2023 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689950223;
	bh=TAtVRatQJl7dp+O8SxA2iZNWmvzPDyQDzJ+19l+YMPM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jr1bpJYXgtl6kH7UuJx2WoWg4zRlM14AAfNfU40kal/bQWfMfCoNDOwcS8vuCiNb4
	 wLu8gn+dumG1/je/9W115PNjpPz/I3SzSOYR6kS/hRv7m/LU2a4ALWVB4EYu8GUiXq
	 sRgBPMfHvuavOl3TzThwDlwMjR3RpfGF7Pvl+8hj5k9yxDwD7m8B1nESPns4rQ2E3q
	 qiZg/TJo/YYQL+hf+3r2OecLWy2DkX0ad/o/IOIbKnbWNIxGUbSDtJ/IESBENNO1oj
	 pRuPeiqEV4TAie6sd8rSCDLMIgi5y5L0fVoXmVVlFiUGcaGfyq5ISw1jbPbcfRpsX1
	 3zY0iA6uS851w==
Date: Fri, 21 Jul 2023 07:37:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Paul Fertser <fercerpav@gmail.com>, linux-wireless@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rani Hod <rani.hod@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mt76: mt7615: do not advertise 5 GHz on first phy of
 MT7615D (DBDC)
Message-ID: <20230721073701.38f8479c@kernel.org>
In-Reply-To: <00a2f5ba-7f46-641c-2c0e-e8ecb1356df8@nbd.name>
References: <20230605073408.8699-1-fercerpav@gmail.com>
	<00a2f5ba-7f46-641c-2c0e-e8ecb1356df8@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_073704_791982_57FA54D0 
X-CRM114-Status: GOOD (  11.03  )
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

On Fri, 21 Jul 2023 10:03:49 +0200 Felix Fietkau wrote:
> On 05.06.23 09:34, Paul Fertser wrote:
> > On DBDC devices the first (internal) phy is only capable of using
> > 2.4 GHz band, and the 5 GHz band is exposed via a separate phy object,
> > so avoid the false advertising.
> > 
> > Reported-by: Rani Hod <rani.hod@gmail.com>
> > Closes: https://github.com/openwrt/openwrt/pull/12361
> > Fixes: 7660a1bd0c22 ("mt76: mt7615: register ext_phy if DBDC is detected")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Paul Fertser <fercerpav@gmail.com>  
> Acked-by: Felix Fietkau <nbd@nbd.name>
> 
> Jakub, could you please pick this one up for 6.5?

Kalle reported that he's back to wireless duties a few hours after you
posted so just to avoid any confusion - I'll leave this one to Kalle
unless told otherwise.

