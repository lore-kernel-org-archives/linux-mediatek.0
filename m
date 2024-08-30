Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E574CA1012
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 20:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5DYk0b96uK4PnOcnOsHk5MFHyi5xVrOcpQ+Yf/oaTw=; b=r25XT3xmfcMHYk4W71k1cFaYsZ
	/XmD3V0CF3k47YWEXrI7VHnRHPuZ6aSqc+0Hj6OGPeSScSoxoh0lFbTqGhszXxINH7ifsF12tL9bs
	2TWZoirsD7RnvmV6kVSgnm+M9bePaCJpY9dRDIauQA1TXYe8+UvtUPf8QxQ3E8A7T0qpE8mELCA7m
	fzPJMdX8pjXI12iRQ2gUl5vG/7duzbGUIRG8d+3755i6Rf6NlCkp3tGY9EBSCV3+3C9f+2LBJjZeH
	BOATAWOaqs3Cx3YPal9FDqGnsx9eesjYilno99FAStrcrlZ0BDeTbZ/Ix35Pd2ptz61jO7mT3U39v
	OackogcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk8F7-00000007bPe-3T5T;
	Fri, 30 Aug 2024 20:29:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk8ED-00000007bAb-30aF;
	Fri, 30 Aug 2024 20:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725049695;
	bh=8LEKb0uhp2A4HJXFfcjVpGZqK+nWvJvHYkdGnpkaJOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwfFWMSOXxuZ9aQ9w61rWlD/lHDZzxwvD4veZnVI0BehMjsAqB5424MhJRQ9mE4xs
	 kDE57UTl1ZFYFx3vvY6jNbGzXZOy3/FHTE17aoxt989ZCaduHorM3k7SSFjyVWgyO7
	 MdmVxXs4qQCdpbESe+pxGX+lzDlOxbaVa6cgREDQiLzP7p4z3H8i9vhlAYfIq35cr4
	 qBNNAf7TnQ1RHuD0gHHPzWj0leVhlleFVRCkGV0xPssf23VXA3p8FA7BERON01iGDC
	 xzucCuayX67jkvL1X6bYM4icXNI+wixHfTY+stS6lSyysYurF+NTDey2lzMaAwAksm
	 uD1JJGDwCoLbA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84F4C17E121B;
	Fri, 30 Aug 2024 22:28:14 +0200 (CEST)
Date: Fri, 30 Aug 2024 16:28:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 4/5] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
Message-ID: <2b03eacb-4cb6-451a-9b45-5c636ae5052f@notapiano>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
 <20240810090918.7457-5-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240810090918.7457-5-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_132818_316005_A0FF1214 
X-CRM114-Status: GOOD (  15.37  )
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

On Sat, Aug 10, 2024 at 09:09:17AM +0000, Chun-Kuang Hu wrote:
> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
> instead of implementing mdp3 version.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 45 ++-----------------
>  1 file changed, 4 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 0cddafedbecc..48432d60b49a 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
[..]
> @@ -538,7 +501,7 @@ static void mdp_auto_release_work(struct work_struct *work)
>  		wake_up(&mdp->callback_wq);
>  	}
>  
> -	mdp_cmdq_pkt_destroy(&cmd->pkt);
> +	cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);

Hi,
this doesn't build:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: In function ‘mdp_auto_release_work’:
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:504:29: error: passing argument 1 of ‘cmdq_pkt_destroy’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  504 |         cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
      |                          ~~~^~~~~~~~~~
      |                             |
      |                             struct cmdq_client **
In file included from drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h:12,
                 from drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:10:
./include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: expected ‘struct cmdq_client *’ but argument is of type ‘struct cmdq_client **’
  111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
      |                       ~~~~~~~~~~~~~~~~~~~~^~~~~~

Same in other instances in this patch and in other patches in the series.

Thanks,
Nícolas

