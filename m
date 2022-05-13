Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41504C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZ5j8nCS6hpTIdhoDGb80xCXEImK9yWy6y4ErwljrZA=; b=GNREji31NOAbGA
	ME9S4P6iQLHFTj0Qynb0TYzKiPIK7evGbDFhlEZHne7bwUQO2wmJyys4sFoiJMtBqVQgv8rlJo8Qr
	Mgks3tzNOkD0UJQC31PihuT9UuJnFDeJaCkQcQS+LmPj+6zaFUs8FfhWG3fQw6LwRKPoEXUWi7Pro
	QCIvzxd+CPlO49kHrxhu8BuJPZV7qHmQLtYmzbasRIhb+NMFLODAdzxrUxbZ75FoLK6LlW2oTYvf+
	zFNdDmrpSYurql6dlU8+emenvP6KsBgTa1ZrGS1J6MHxHY424Xu4GbEpXDfRehcq9BuLAhFnzDWFo
	6v/q5Ofat2npZkJRWNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npQJw-00ExsR-Fm; Fri, 13 May 2022 08:06:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npQJl-00Expa-GF; Fri, 13 May 2022 08:06:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 35F7D1F45D41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652429190;
 bh=ZI6wzdoqnJpZaI9O6789OwrBHqpXwo3joMPdEwRzXpE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ACtYtZm3nPrQX/Loy48UlYk9vfJa6ETK0abgly3cu3X1tgHT4OAB6CB5d/CRTQpt9
 amrdAsrm1WJYGlgpG8/QXPiOAjouDNqPgaHb59GExHJF59kKCNgEq+lvOmHyxdDmn7
 GHYK9+YR+WLcrEGAVRO9nb8GVAY804GUvcmp97D/+aAGvZsb2MJJzef27r1xgWwSPT
 5DGPxF+xTZzMKyEjhIGAQG0oslLH3OWuaxcLOl9WD8Q413A7HQT52wNJSDZG0fxPM4
 OYmbKoUAV3eksDMqPfUJ/1Jif8l5KxMuoa8WwThc2ilHAhip097IVnqOGpE2p8JkdA
 wztwinkpeFDGQ==
Message-ID: <d015e667-f7a6-d635-a2ea-c0638881af10@collabora.com>
Date: Fri, 13 May 2022 10:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4] pwrap: mediatek: fix FSM timeout issue
Content-Language: en-US
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 tinghan.shen@mediatek.com, hsin-hsiung.wang@mediatek.com,
 sean.wang@mediatek.com, macpaul.lin@mediatek.com, wen.su@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220513034356.5268-1-zhiyong.tao@mediatek.com>
 <20220513034356.5268-2-zhiyong.tao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220513034356.5268-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_010633_725673_FCFA5C65 
X-CRM114-Status: GOOD (  10.40  )
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

Il 13/05/22 05:43, Zhiyong Tao ha scritto:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 
> Fix pwrap FSM timeout issue which leads the system crash on GFX VSRAM
> power on.
> The crash log:
> [ 3986.543401] mediatek-drm-dp 1c500000.edp_tx: drm_helper_hpd_irq_event
> [ 3986.670756] vsram_others: is_enabled() failed: -ETIMEDOUT
> [ 3986.670765] mali 13000000.mali: Power on reg 1 failed error = -110
> [ 3986.670768] ------------[ cut here ]------------
> [ 3986.670770] unbalanced disables for vsram_others
> [ 3986.670783] WARNING: CPU: 7 PID: 4125 at drivers/regulator/core.c:2761 _regulator_disable+0x194/0x1a0
> [ 3986.670785] Modules linked in: rfcomm algif_hash algif_skcipher af_alg veth uinput btusb btmtk btintel btbcm btrtl xt_cgroup bluetooth uvcvideo videobuf2_vmalloc ecdh_generic ecc mtk_vcodec_dec mtk_vcodec_enc mtk_mdp3 v4l2_h264 mtk_vcodec_common videobuf2_dma_contig mtk_vpu videobuf2_memops v4l2_mem2mem xt_MASQUERADE videobuf2_v4l2 videobuf2_common cros_ec_rpmsg mtk_scp mtk_rpmsg rpmsg_core mtk_scp_ipi ip6table_nat fuse 8021q iio_trig_sysfs cros_ec_sensors cros_ec_lid_angle cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf cros_ec_sensorhub mt7921e mt7921_common mt76_connac_lib lzo_rle mt76 lzo_compress mac80211 cfg80211 zram r8152 mii joydev
> [ 3986.670830] CPU: 7 PID: 4125 Comm: mali-cmar-backe Not tainted 5.10.78-CL2781499-v287 #1 b899b40a63da40d4767c6c0e96b6700d2f3eb242
> [ 3986.670832] Hardware name: MediaTek Tomato board (DT)
> [ 3986.670835] pstate: 60400009 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> [ 3986.670838] pc : _regulator_disable+0x194/0x1a0
> [ 3986.670840] lr : _regulator_disable+0x194/0x1a0
> [ 3986.670842] sp : ffffffc016203a10
> [ 3986.670843] x29: ffffffc016203a10 x28: ffffffb7c3186b28
> [ 3986.670846] x27: 0000000000000002 x26: fffffffffffffdc8
> [ 3986.670848] x25: ffffffc017225000 x24: ffffffb7c0e94880
> [ 3986.670851] x23: ffffffb7c31840f0 x22: ffffffd6b4f3e275
> [ 3986.670853] x21: ffffffb7c3181a00 x20: ffffffb7c27e7800
> [ 3986.670855] x19: ffffffb7c27e7800 x18: 00000000ffff0a10
> [ 3986.670857] x17: 0000000000000020 x16: 00000000000000ec
> [ 3986.670860] x15: ffffffd6b44fa17c x14: 0000000000000003
> [ 3986.670862] x13: 0000000000000004 x12: 0000000000fd8318
> [ 3986.670864] x11: c000000100029ccd x10: 00000000ffffffff
> [ 3986.670866] x9 : 7dd6d080afd6f400 x8 : 7dd6d080afd6f400
> [ 3986.670868] x7 : 0000000000000000 x6 : ffffffd6b5459f0c
> [ 3986.670871] x5 : ffffffc016203a58 x4 : 0000000000000000
> [ 3986.670873] x3 : ffffffc016203668 x2 : ffffffc016203670
> [ 3986.670875] x1 : 0000000100029ccd x0 : 0000000000000024
> [ 3986.670878] Call trace:
> [ 3986.670880]  _regulator_disable+0x194/0x1a0
> [ 3986.670883]  regulator_disable+0x4c/0x8c
> 
> Add a usleep delay to avoid busy read for the H/W status.
> If (time_after()) be turn first, it maybe cause the system behavior
> crash problem like above. so we change it after sleep delay.
> 
> Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
> MT8173 SoCs")
> 
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
