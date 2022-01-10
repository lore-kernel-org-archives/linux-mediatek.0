Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D106BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07oqsiSMTX6fMZ9ITx6isa2hDM4hT/ErEWyprBaslL4=; b=Jmzc7jd0qmds4kdfzW5sdrvp1U
	kxIdA/X/Rgbgt5uti/wuXmaXxVr/Y++9bX2VVB0FxzjurSEKoNKiEhaNV/rOFTGWhyn8PafclVNIz
	cplBOkRL5dtZ2LlbH7qDP9JSJT+MhsZyD2AE0SldfzAh2tGczpfb2vz8OouTHcBPfvkxQN6NtUXBf
	HPGcxnvMgLa1vKmh5paWAAdOR6oQjngHE+W2rYRwJKMfv4/HNny7jP1FjKADcI7f3DlnCUXtKl8u5
	fJTUCzw0sigRco8/iWFB5AAM7mAKyvrKWk5KNgLXG0GiByvNS+SyV9tfAAqh03SlhZPqxwzyjIN6s
	ZckUg97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wys-00CBD2-Du; Mon, 10 Jan 2022 15:53:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wwL-00C9NR-FK; Mon, 10 Jan 2022 15:50:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ACEA11F4331A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829832;
 bh=QSlVm5Djrgd/teW7o4tjSoRPfgMOgy5pEDv/QJP+kuM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZfqBin+xuTfCp+u5VjI5q2cthgjAobXQC3l5Pnsi4VicrF107eYtx62s0RbrVaWjn
 rlx/vNgrO1GIlt/uqsKuiw/OvCCbIc+84tQWY40zdmumxeSrN775zeKfpTozPmDxXa
 RSfOLJ852XOhEZLebi1UsphofgkB2/V+Iwpjy/TG01l/fFx77B/nyPl90N9INfWNyh
 aqFewn/1FpaJRWphPFE7sfhdN9nHPAG2QDCayyeKEqxhBfsPejciAp4V4WacoIavQ7
 PMI3BQ1jgLmsLV6rKatRwJrTnMdwhPJi7mimCZSHvrZr5iGM6CuTCBzVXaGiJ+mhVg
 AviY+foZjbe4A==
Subject: Re: [v1 07/16] clk: mediatek: Add MT8186 imp i2c wrapper clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-8-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9233bc50-b377-c16d-2d03-a71770de0973@collabora.com>
Date: Mon, 10 Jan 2022 16:50:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-8-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_075033_701764_2D16164F 
X-CRM114-Status: UNSURE (   8.37  )
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

Il 10/01/22 14:44, Chun-Jie Chen ha scritto:
> Add MT8186 imp i2c wrapper clock controllers which provide clock gate
> control in i2c IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
