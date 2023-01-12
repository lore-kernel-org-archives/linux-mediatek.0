Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE00C61DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 20:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nmg7QlhSKTfFifHhDMi1sVln4cZ3X+QtnkPVLOUvTg0=; b=mxB8c/RkuM9E+fdE8wcSkGQkvX
	kTOo4L9YJTHy2yq/mpFh7+l2NgXbmOLOXIaikvFTizubUbXCyq97CJttI/Dyl7M1gqOg8+1Le7TJb
	OOlaCxZUz3iMhHSKTA6eNl7o3s8cP8rTPTXotwh4rA+hF6FfGnZdTh1QpkvTOKJIy6ODkPBBlEQjX
	AKfjXDanmG2AoNeybizDoQ1FzwYSs+NWevDsM0rzJOCjIS1fkqvF2kyEXmCYZGQv+l3VHCc4HVBlN
	azTlIa4vq6F6FgP5tLnmX5bBJjB5cpB28xmU6IDmLX7os8d/fQMly7zN/ldOgW89MVyr/6mjA+biV
	Stla4bkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4TC-00H1io-Gm; Thu, 12 Jan 2023 20:46:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4T9-00H1fY-18
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 20:46:40 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FA2D6602CEE;
	Thu, 12 Jan 2023 20:46:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673556395;
	bh=FtkDtIh6NMt+QWac83XzUxw2O6dDKVoMsCkF62h/iKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnMjxNlUxyaP13R1jyHTlo0xkMblU1UCSxC2dB+y8a0lVa3xWzKh+gn8scVwNGA99
	 e08g1aP1kOOoOhCJQT5cw6C0Rt2QuERtIN9Ee60YgQxAlUKFXL+gA9BVEsfMDZnwJl
	 /L0wA5Ri68qFOaPNwFPvu9+DFoVjtj15buSqvLpD1AXAum8QWwoS2IWJaDIaZBadbA
	 46ORAtuNPu/DONI3CMuEt6IFRCtu/lllUMpTie48YyGkxiXnoRE/e7S/yh18HJ0G+G
	 5JG7q5MKbRaNyjPGK84tOuohwlR2v3Yh3LBFt8Ba985DZfo+tClO5+aV5nFeNlSV/h
	 kzDfjlVv9dn0Q==
Date: Thu, 12 Jan 2023 15:46:26 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
	yunfei.dong@mediatek.com, shawnku@google.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Justin.Yeh@mediatek.com, Allen-KH.Cheng@mediatek.com
Subject: Re: pull request: linux-firmware: Update Mediatek
 MT8183/MT8192/MT8195 SCP firmware
Message-ID: <20230112204626.ciaff4amseoidybw@notapiano>
References: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_124639_318889_19C29C17 
X-CRM114-Status: GOOD (  14.74  )
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

On Fri, Jul 22, 2022 at 04:29:34PM +0800, Tinghan Shen wrote:
> Hi maintainers,
> 
> Update SCP firmware for MediaTek MT8183/MT8192/MT8195.
> Thank you!
> 
> 
> Regards,
> TingHan
> 
> ---
> 
> The following changes since commit 4421586e8e95ce789cb6b3f1af98962bfef74c7b:
> 
>   amdgpu: update renoir to release 22.20 (2022-07-19 06:44:08 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/tinghan-shen/linux_fw_scp mtk-scp-20220722
> 
> for you to fetch changes up to 56cf6461a82b08facd41154f7c44a19f0a085f66:
> 
>   mediatek: Update mt8183/mt8192/mt8195 SCP firmware (2022-07-22 16:16:27 +0800)

Hi Tinghan,

the SCP firmware for mt8192 added in this commit caused a regression. Gstreamer
currently supports using the decoder on mt8192 only with the MM21 format, which
was available in the previous firmware, but after this commit the firmware only
enumerates MT21C as the format available, hence breaking the decoder usage with
Gstreamer. Please update the firmware so that it makes the MM21 format available
again and restores the functionality.

Thanks,
Nícolas

> 
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8183/mt8192/mt8195 SCP firmware
> 
>  WHENCE                  |   6 +++---
>  mediatek/mt8183/scp.img | Bin 1032064 -> 1030776 bytes
>  mediatek/mt8192/scp.img | Bin 327968 -> 328096 bytes
>  mediatek/mt8195/scp.img | Bin 429668 -> 429820 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)
> 
> 

