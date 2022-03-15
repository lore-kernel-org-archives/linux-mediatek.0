Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E261DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nguJLs1+oufRAMjgUDt3zX6eUTOPG8b52dRQSNj0EvY=; b=T63M9bywaFZYRu
	jerW6+ycZ+PkQWXGB9W6XAGvrYRqq0PwJemoQHgHtMQMV2XYtxtPR0Fh/A2fcOwc78b9AUci5owTQ
	PLdMjq4u1fPsAhq83pt+2YCYpl3g1XvzVLZ4uThAKzYccj3YbUJsS15eMNdEQ0WEatiLiFdWLftDA
	TYe3W7yi5VgsXHuXMXw4CWt702NvGWhHA6lsOVLnq9Fg6O3sxIwY8Nr03N8ik9q2iq1H2QB1GgsO7
	4BtKXDGJ+3doEMrtDE6N6wdV8zsiZIsxpEdznjazigXNo0Uy/vm/wccwlU3VqvtpPForoSxcg1pOE
	KFDq5W3KRMuylUJnZ8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3EL-008Sim-0d; Tue, 15 Mar 2022 09:12:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3Dq-008SR3-Fl; Tue, 15 Mar 2022 09:12:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 065801F4362D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647335525;
 bh=J1o3MrM8shQvHOe9QBv/WeEjY6Tm+WOVtQ6YaUOVwIk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eNNHbE5UpBdkuSQJK+BDUlO6seW18JfU0jxHHP9mvASSwDbrAK8zN+cnSrdkJE7/E
 +m25y5dgXsjYLUVnUKgjiE7Ip8UTtBMNBlznzxAh1mgIlMmZUgKe8ebaH1Qffr0WXZ
 P6zNSp6R47i6ttlSx0rDB6IdLOWpo6LywyBFYAhkzpQLEvZAIX41WxwVNh6/K1SUOn
 FKjC1DX4Kbp9MxIO5UO2CLmY4Wf+/JwjcBKe3I09r7GPfdQmxW5dAW+t+HH2Bf/aeN
 LEid5oF1KkqlD/GUMzWOXu+3DmkkQ8MqmHgKjN7JTjPVPnITdx7uzo2v5yp0lQd0/h
 Rn2qTddUrrnGA==
Message-ID: <2ea21809-6e7a-e487-ebf3-a79b62f1349a@collabora.com>
Date: Tue, 15 Mar 2022 10:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v13 4/6] dt-bindings: soc: mediatek: add gce-client-reg
 for MUTEX
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
 <20220315061031.21642-5-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315061031.21642-5-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_021206_708025_58EE43F4 
X-CRM114-Status: UNSURE (   7.39  )
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
> In order to allow modules with latency requirements such as MDP3
> to set registers through CMDQ, add the relevant GCE property.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
