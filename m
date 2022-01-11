Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaXCqCvdLYUrrohhROyCr+kdWVamlSunG2ZbYG77CJA=; b=q+XxooUvUus///nYZWCar1GtMz
	+Dmh3P7KJ5On3PvWosLToJQk5GVLHVwBWJa3Af0smbFU/ALPy5o80bSWbJEtbX+I4Dsiu8/zuTCjl
	DzMXZKb5OvU4hnQ1dAqWZvIBHyj5v5iJZeZsOtqyeEhmmlca+tKj9awJqJkAGKjGVb92TCLWaFi7c
	QWYpWOXogu/ze5QNK44kymU++6KqVw5u8tjY/zg7eSLZCYlYC63N2dxf4rw30MCdilOqYnL3bvsU/
	nuFIydaXF5oGJiU6l2sl/S9xUESUipCXAZd4Gqi9BKad7Tolp9As1LV8jptv8bZInRayrPQTZiQoI
	/QQIjidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7DcQ-00Fc5H-M5; Tue, 11 Jan 2022 09:39:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Dc4-00FbwC-Vq; Tue, 11 Jan 2022 09:38:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 769901F443C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641893923;
 bh=Q/6Me6ojHK+rFOvurOL4GOexW3JhCSYadj07qWCpmxE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bkXPEBQax6aQFrFKuKmdW/MnM/6LD8uYLLroGHSqlmSh+MmqBwb+AbrViUzS6wS0N
 pq112rFRNhah3eBTk/KiqBkAt9U15FluP+2Aqpj1wL6w8CyQRVOY9Ysr4dRhOY1oMt
 yhtTkuKgsxLAvRuOZgwbtRbq//QzWs//aMFR/mJbr+QTQtzSDrDQZLU9oesg7HGqNc
 upJnAE2MibKDANZVTSV7uv27vjHt5ZFm3gfcAwYLkPzFFJndvb/wjB121UJ0OXK4M2
 plESTxwCCI1vWbS88X1x2GwCPBWtJY2+o1Y1Aeb892nITs8rZt3EDbbX8F3cAMBYIy
 xW748duNx3lGg==
Subject: Re: [PATCH v11 1/4] soc: mediatek: mmsys: add CMDQ write register
 function
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
 river.cheng@mediatek.com, srv_heupstream@mediatek.com
References: <20220104091712.25670-1-moudy.ho@mediatek.com>
 <20220104091712.25670-2-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <39e4ab28-be15-f06c-e444-5f84cf08aa52@collabora.com>
Date: Tue, 11 Jan 2022 10:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220104091712.25670-2-moudy.ho@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_013845_197276_40FFD8FA 
X-CRM114-Status: UNSURE (   9.11  )
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

Il 04/01/22 10:17, Moudy Ho ha scritto:
> Adding the interface of writing MMSYS register via CMDQ,
> users do not need to parse related dts information.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
