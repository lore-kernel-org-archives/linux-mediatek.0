Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7AFC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB5LOWwfzkeBk+fzBd4WajVo44tdySTl7uLgJ3qk21w=; b=w7Jdj+qxmYW0UuT7bGgowZ7q06
	ZSkqwonCyz05IH71GJR/VWfF4x6ef5pVt0wrZQ+KFoKVRwzWG9TfDbFXW3hxigqE8F0gIt3L6qEnM
	2Tp3XYIZY49DcIoTbUxLivSU0H5iA9+4KDDbvZjVUErQno8h5/tEFedrTBoqoWkQsqT/zUiuAdmgT
	sMPATjZck9v82JB+f1oqXKoyfN35rRIuJGqblN5Is3qjGrR4aYrDguZNCvLfORrwFJlAwk4+r4UmG
	zFRJeZBqouTxaCqQ/WaoC04JFWkXs37FVdEVsxEvTeLutVR8U3AB5GlwhgR8DkLLOYy+SmKdrWoLW
	0/52TKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSAc-00Enke-Mj; Wed, 28 Sep 2022 08:11:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSAQ-00EnhF-7n; Wed, 28 Sep 2022 08:11:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 660DC6601FE2;
	Wed, 28 Sep 2022 09:11:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664352700;
	bh=nnLUK+aN6Lt3FvJaNIA3WC4W8c8pNG0EQHNGq3Mu/Eg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O3rsUcKN4/2DqQzIu/etACkLMGpcdqodkMhxuEPdRuji9Ulo/oURMEXpCsZlypIcL
	 mphHF3ZtniQUis/9JfVp1PCZtT1mJTt5Vc2PBcUxSuFL8FnuvB+alC5Sv5PclBNnwA
	 PsCaHE+IrViPcwWiT0zSSgPtP2tD1Su/qddiYf+HDrufIb8OnHPSSn5LM8eLbbAjSC
	 u8PpT7aSZGXT1b5622YetAgmKFHSn2vDgQD+5khKfrGy5mE83NOWNZNhUURhAUG1BI
	 UnNbipsBop4kwijBPWi3Gd/WGrFvr0pIlhRKVreQH1YcXRtPAi/wNdgYfHoLdm2qbc
	 gYqFK7NFeHTiQ==
Message-ID: <ea20ff46-11fe-12c4-3e2a-5058f9065c60@collabora.com>
Date: Wed, 28 Sep 2022 10:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: mediatek: mt8195: update audio tuner settings
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220927151141.11846-1-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927151141.11846-1-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_011142_453122_89B2EC60 
X-CRM114-Status: GOOD (  10.26  )
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

Il 27/09/22 17:11, Trevor Wu ha scritto:
> Audio tuner is used to handle clock drift between 26M and APLL domain.
> 
> It's expected when abs(chg_cnt) equals to upper bound, tuner updates pcw
> setting automatically, and then abs(chg_cnt) decreases.
> In the stress test, we found abs(chg_cnt) possibly equals to 2 at the
> unexpected timing. This results in wrong pcw updating.
> Finally, abs(chg_cnt) will always be larger than upper bound,
> 
> As a result, we update the upper bound to 3 to handle the corner case.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



