Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E614C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 09:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fMIF1oGkQgrIL31OkUoZ82W3j7Fawy0xcHWVYd/LZw=; b=kv1GTmYrHq9s5/
	U8R1RLEu/pccPzp3Eg0puibasg3sgseUJPa1tV3jR2BTZV59knen9Hrf4+DbL+lzKZ6osI2QrtbhL
	ggYICK4URL7zngDJh2PkQOB/iFRlOcNfyd2HnbUkdS2iS5O1YbxyqBAlRNNESZMnOuNKcG/HhIJPf
	5BdSiirpcRepmFDzrTHUnZRQkkBQgAlyrvKmvF4MvcBi41OVuqOLbdMruwX/Rw+dnxI41tEn0abqb
	AXuypRC4zxWecfFRrGyvHy42z2KFCuo461sZiQ92YtvB9MCtAO2TL5J6DlcDwfXke88iW+76lvR1G
	d+mNY3u3Kf9lXA6CwgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3FW-008TRM-N6; Tue, 15 Mar 2022 09:13:50 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3F5-008T7v-2r; Tue, 15 Mar 2022 09:13:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 446551F4362D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647335601;
 bh=WTLghMeeqz2nQSPwBowI6r0QAX6EDrZ3m29sr4Yi4ho=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oi1ZZjAsd6/qOeKtUyGx8/ixu79ia/qbH4VoFPcFMWoVY8pV3Zu1zwIR6VA5csjQr
 uo5jscAUKtBxJK3aG8FzWinOow4i6RTQvAv4wgC5FapKTvFZcuIfNl8TpP5tgxz+9Y
 k6+mdae2ApV4i2I6leHG0pdaCjatXJtZvvjxdxaP3oZwpbTpw53iQooCjAjOZ7KwHk
 nUbK4EQlturOL/GHmBKbZAoUUHsSFBmkD5oRApjljgDarEHwenrHVFpcs+US7S8c/2
 Z9V8aBKwyBx8sWPQi3iYjvshI+oohpw2yDy6xFochfp+r++vuU7s+dnYSNXyYNDghv
 Fp8lwNjMQ9g1A==
Message-ID: <5fb2d5bc-9951-86f7-d825-8dae9b7c7698@collabora.com>
Date: Tue, 15 Mar 2022 10:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v13 6/6] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-7-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315061031.21642-7-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_021323_315210_59C7C4CB 
X-CRM114-Status: UNSURE (   9.21  )
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

Il 15/03/22 07:10, Moudy Ho ha scritto:
> Due to hardware limitations, MDP3 is necessary to enable MUTEX in
> each frame for SOF triggering and cooperate with CMDQ control to
> reduce the amount of interrupts generated(also, reduce frame latency).
> 
> In response to the above situation, a new interface
> "mtk_mutex_enable_by_cmdq" has been added to achieve the purpose.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
