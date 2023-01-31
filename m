Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95191C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qFNwh7DjXRsZiX58oqpDs6Ww8DlJBDEK9XkOGOGj/s=; b=PSI/+lD3MKecvCDpejTIddlrxp
	jhitmKaxFS2jxVNg7i7zzmoNAAD5eoyDrP1FnojuK9akEQs8dOdyVu3KCc8S8RE5EpXWBTXLHeW0I
	2iyhiEGNYKZu+9uyVFimMh5FSle8/NmVprbPXCUMhNwsLxCUiAV7J3dOQ4iQpEFPR3q9v/t2z7tFn
	PYPNWG1GC7RwtlQEryMGj8EvVZFqTNojdSSRDdw4mILVujM9ViZT9mRIwsm4x1r4I/dTOoL65EHQo
	+HWesSKtDUM2lJ+RIvbqgEr1aq7YYDSPwTmtEa9uCVouWW0moJKwB4GcnlGziLMAElVU/zusQEpKd
	TPjVYjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm6l-006kto-Ri; Tue, 31 Jan 2023 08:35:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm6G-006kcN-R2; Tue, 31 Jan 2023 08:34:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B26816602EB0;
	Tue, 31 Jan 2023 08:34:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675154083;
	bh=gk51BAwxxzzaABKBP2WotRoLxqVnUC7sVm/G4eOrCFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R9VyU3qxX7AEcl+PjF66YNawyr36hWB9F55uHVuLiAbGrkePSC81KWH58V7Hb0S13
	 n2Wx5Udk36QZ3VnRQD+l6xdtFo2kYsZJ0tdYjm0jcoHKiRXPII/vIIs+WZUWV8SyvF
	 rMRipUurAvVndfWvlesKQ8I7l54ZEXEd6EqdLbhYxlyN8TFB+ZANflibWBccuFDCQE
	 wyFSU/yc7vPAGKiAniknm4FNgnXjSzqddtADpBpNu6ilj5gwc8l8SZJksYSy+ZREMT
	 DLzp4//yT96L9QvSUmrQhrzigRkkNinrXhNp7Blx2Y4NeN71T6IFLGgo6TJynialHF
	 0ked1AunctcKQ==
Message-ID: <ff2862aa-288d-7c81-8867-521f62b6042a@collabora.com>
Date: Tue, 31 Jan 2023 09:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/2] drm/panel: boe-tv101wum-nl6: Fine tune the panel
 power sequence
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1675130359-24459-1-git-send-email-xinlei.lee@mediatek.com>
 <1675130359-24459-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1675130359-24459-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_003445_043409_374C8084 
X-CRM114-Status: UNSURE (   8.44  )
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

Il 31/01/23 02:59, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> For "boe,tv105wum-nw0" this special panel, it is stipulated in
> the panel spec that MIPI needs to keep the LP11 state before
> the lcm_reset pin is pulled high.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



