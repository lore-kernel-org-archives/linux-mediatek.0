Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD2DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPOti968u+FqywICrny61gyEOyqjfyFMO8XKrp3+buw=; b=A5JfM3/kJso9U2
	bT2wE/iRa8MZLDZL8r/IcwBS1sTqkhKF/XtcGiGEnyjqIInvlpDstl/YRInNojgJ9HT/FAC/Tk8FU
	N9YmIHYC31bbpYodT/AcGzoFWWdb4L57mkjRCpS49uLHac35ktRFZGUq6uhVT2asN5G+dCrhe/Mng
	sYBpy0zWvQ8l3lD96THTAbbRsSh0ok5JiQijmdSdSF+9itVIcqqpdnGbB2uR3VoTH1eSDvY5Fx85E
	QVbE68rmbtKale1Z3iT+RP/ODvDgPIKLSxuzlDzFjlMiTNcH3ezJBSYMYAOl2mFBgN8jeAm5Q8Kwr
	LddPgogsmq8jCxnLLEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnUf-003ghd-Rt; Tue, 19 Apr 2022 13:02:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmMk-003Fnm-Bn; Tue, 19 Apr 2022 11:49:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5C0881F42293
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650368990;
 bh=r6OoFRF0ucAMfAcDbrXpKkVoip13W6nPZWDxs/jqu34=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MHicWKIVvPyXryi5j5G1lgxR2qQrHIMMb5/s++e8qSu56qaTAz63/Qm65bpr+z+5c
 6Mpg2j9JCJBewIONfXZ0w6ZRHVaa8CugNKrVr2eiJcbHSFc/cYVfu8BfEhIhRZRcJY
 ZAZNhXCrwc6F7xKHzAVoZgFrCP9gpcdl9Dhi4aRuE3+0sIoij5F2/A9hwPtIzX+lpg
 GRyqI8+EkPs23WtwzMuJV8Av8D9h+CgLdEo9kh8IPIJcnIndasDYNTq6w/CL4toflU
 /qw6xL8Tzt6Pli4EQ/9GQqiMISGObmpPwn8fD0YG/l5nZ3wrU5z05xBOd0MGNi7yl3
 CuuPiXLjd8kXw==
Message-ID: <cb56d23b-fb80-426f-cc30-50ef351b0ad6@collabora.com>
Date: Tue, 19 Apr 2022 13:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] remoteproc: mediatek: allow reading firmware-name
 from DT
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <20220414122140.6114-1-allen-kh.cheng@mediatek.com>
 <20220414122140.6114-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220414122140.6114-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_044954_748422_680AC498 
X-CRM114-Status: GOOD (  20.35  )
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

Il 14/04/22 14:21, Allen-KH Cheng ha scritto:
> The SCP firmware blob differs between platforms and SoCs. We add
> support in the SCP driver for reading the path of firmware file from
> DT in order to allow these files to live in a generic file system
> (or linux-firmware).
> 
> The firmware-name property is optional and the code falls back to the
> old filename if the property isn't present.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index ee6c4009586e..82813d74e829 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -809,9 +809,14 @@ static int scp_probe(struct platform_device *pdev)
>   	struct mtk_scp *scp;
>   	struct rproc *rproc;
>   	struct resource *res;
> -	char *fw_name = "scp.img";
> +	const char *fw_name = "scp.img";
>   	int ret, i;
>   
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);

Hello Allen,
the remoteproc subsystem provides a helper for that, please use it:

	ret = rproc_of_parse_firmware(&pdev->dev, 0, &fw_name);


> +	if (ret < 0 && ret != -EINVAL)
> +		return ret;

... this check is necessary, so you can keep this one.

Thanks,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
