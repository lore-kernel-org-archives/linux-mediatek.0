Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB00FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhW6sijDanRu05y/muOc8Y/Vf+onfJsfd0Rufcnydu0=; b=EklaVcpRz5/xNn
	3D/M+d4bveEDkTpwcwN1GEqmRstS37HFtx2rYAVFGvS+O5qwn5knCFrbOFwscy7tJFg0Fu3nwE8Ee
	3OUfp7zg8VA2y0xl/S3unsyCFLAJCFFV6lBe3GxT9MM0Hk/UW7hV5zZ88wL1w95lCqSgIx9jOonFA
	MNtCti7AQ/QflSpdzjd34+8fYBwDE5P1KYTBpVwtC9Mt9khDAU90PL0Ya+14KPD34+h8NrNbytEik
	Nx0gaPWBr7auClrS7+yhLGPKnNP3kc2+JVQar2RqbIMn3mlm6vIsONGJeRqNHjvE9XDBWTjfJK3KT
	Zclun+IgtkrBZoAqsJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYn9-000b7K-8E; Thu, 03 Feb 2022 09:52:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYk2-000ZMO-Jh; Thu, 03 Feb 2022 09:49:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9FA791F45309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881765;
 bh=bARkQo56/z3a4a3bVjDzMfuLx9fNoMUA9cghljgNxIA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MpKhToUkeJcSvFz8cPFyQ4Wt1GAorxTEX493fgXevU490mCnLvOkdLcp2uyJRs+eO
 uEWdQI9R+k++tgmZkxuu1v3IRyIKm4hzPeGY9/KuiA3RAV0iVTVads5nK6/kEDwGdT
 YWMr7pr3mdel95IoU/oN18yUrtWuNsmNGJxJll44PIX9hVA/kcj9H5dJ+KkHG4FLPS
 kKY3IxEyq79R8Wn0lvfnPpfeKDXeMvYESa/yLdt4jyZTK/eqQAu5tnTMyd/zdZ4NSm
 I3qDNf4Dmm29kl2+krXfHDCMvYw9Wr2gckPCWPjD9UXut0rP0tazQHxDAYhJwtqdf5
 OoBauzrgmiUtA==
Message-ID: <1496895b-2f50-d52a-293e-cac81928056c@collabora.com>
Date: Thu, 3 Feb 2022 10:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 23/31] clk: mediatek: mux: Reverse check for existing
 clk to reduce nesting level
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-24-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-24-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014926_868716_C45DC224 
X-CRM114-Status: UNSURE (   9.60  )
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

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> The clk registration code here currently does:
> 
>      if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
>              ... do clk registration ...
>      }
> 
> This extra level of nesting wastes screen real estate.
> 
> Reduce the nesting level by reversing the conditional shown above.
> Other than that, functionality is not changed.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
