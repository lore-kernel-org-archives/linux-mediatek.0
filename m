Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01707C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vxzm7UvY3E6nmWc5kSDenFTvkkwKGIDAGaOco4Im3Y=; b=TiXIeQZXW7+P/v+tcA/wNlueLP
	OmX6N/CfenZtSDfHpZRr+ntvYei9mTdZwcCZ+0YxBJ0/Gg9MWcy7Z4Zjpxte59dGtb1xhi5CsmpsV
	tB0jxeQBDEQgCVTKE+TwMU+5nhe2t+Enw+h72HHB6ETvNc+Mp/mGCoBZ/R1lRCiXgWgNYGUAf2BX9
	AFVRF4bQ3qlYYQ5PvfgbpUhHH0HGgpAeUXBHPjEbMgugkcrWl+lvSJeP2JUAI9aG8rIARcuOaY63W
	VMK0CgReX4MVVDUBtT103iKGAOpypvBuD6CeqNmXH9KKLvTDhnvh1XnT2WxEwJALCNJ5s+wIZr51D
	lnK0Jw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wEt-00DIlO-0I;
	Tue, 30 May 2023 10:06:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wEo-00DIiJ-1W;
	Tue, 30 May 2023 10:05:59 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1B1D166059A8;
	Tue, 30 May 2023 11:05:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685441157;
	bh=IFEh9xUtBJ9o/3DO6FK5coeeTQJVx9mIKVRRSoGucss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cqg3wxNMrjsgnS+BQadiK5VX9GeihQjwVdZMM+9EdWoIPXISRKwr0BXvBQ1k3pZb7
	 tzw+uxKrUaVcZ78WraUnkF4trcZBKxnMEWcvSIjhn+MIjEcB8B7qpdS48Bwi6jof70
	 +xyCgnECJ/ya6s7oeyh7TPvqAMjfbsYBDmrbs7HKpDCGGzEmYkrj1X+NiGZdyaKc1Z
	 S5aKiDPK8MOwPezQqabUg5lZiPZdtgv/vLAvO4llm3e87AB+2nmxLRNBmhHk4NpujK
	 i5vV1nX7Mw+BRZYf4V3ikGv21CmoPoHQuLYkvcKstS5XAUJ/jLCEF7FtkKtidFpWl/
	 9vz6sF0YJV11A==
Message-ID: <cf49601e-2ba8-4629-dab8-9253bd95e275@collabora.com>
Date: Tue, 30 May 2023 12:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5,4/8] media: mediatek: vcodec: Get each context
 resolution information
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230525021219.23638-1-yunfei.dong@mediatek.com>
 <20230525021219.23638-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525021219.23638-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_030558_639259_92FF668E 
X-CRM114-Status: UNSURE (   7.73  )
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

Il 25/05/23 04:12, Yunfei Dong ha scritto:
> Will store the string to temp buffer like "echo '-picinfo' > vdec" when
> user want to get needed information.
> 
> Then getting debug information using command 'cat vdec' calling mtk_vdec_dbgfs_read
> to analysis the temp buffer.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



