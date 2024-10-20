Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C78ED3C927
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTkQOWt01yI1NE4iVB+SDk4vWmptzzQ+PpISRYB8H3U=; b=OMiQ1WnATK/cmFcJTY0QZ9x+RW
	79gjZivdwpn1SXtnDN30IFwsPBGeZXpG/VhL57Z82RPkeYIfIHqNRDNf/wePOhmm9xLDtNHMb72y1
	j6ICW5rFLcpzyGWrCtoBBg1mHoBRt/83mEWYQfJch+btci6Z7K9VRTuLxQwPyXXOQqTr4VhNJJV3h
	zCgtj3LVilE0n07zETbXFsK5LD8GOSbiOMC+AwsppofH0hd8p8aSSGC/Fe1IgffWLt879hv/ilAPS
	W9QZch4nzYQtxJN0lZlpOaJ0mKEGDi1Lpx9itYDBsG23OP2l5Px2arIMS/hB5Z62iOIhsb2mQyJ5f
	ncDUHAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NHS-00000004NQx-2m1l;
	Sun, 20 Oct 2024 04:11:02 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NFx-00000004NFq-427c;
	Sun, 20 Oct 2024 04:09:31 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7163489149eso2639892a12.1;
        Sat, 19 Oct 2024 21:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397369; x=1730002169; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fTkQOWt01yI1NE4iVB+SDk4vWmptzzQ+PpISRYB8H3U=;
        b=Tv9ubwXB94LhaOTD60Nfhg8q14H41TflicMnGnyvrcKR9rK0wHjaXjnm/57jjCCrof
         fz/T2h1JJFJEWawpideGsL07DduQbTCEuIVlkNEZAKQvBrBPAefMRfdcJqqCXm/d37Xd
         s086w98AL6DgcGIrPFsopWD3NTNmJx+Po43yOVmFd4ItmlOL4Gz4ihshEb4M6NWjVZXW
         JXvIaH02C4C/2CMMAf+WiOy/soh7n2Tgk84c8oLOEKKwrc5A98f/K02hq6BOYawopVLz
         AJsJOqn3CZ52FECMe5fkuIMoj6V5dfjLx4vvW94g2ptdoKCtd9E7Jukrn4Q5MXXSFS0+
         5Rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397369; x=1730002169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTkQOWt01yI1NE4iVB+SDk4vWmptzzQ+PpISRYB8H3U=;
        b=XHnmMvpevxLgxA49spbBarYnJ/Z+vZczYkDCi8vxRvQjfjf0zHB8TbVP6gUApkO2NY
         HlnQsAGVYmkwFXo6wGe0J34UHeWlO3JabicyFPlhoHOIyZ40A4PcCqpE2LxrIlQk3e9t
         WGmzw2EHfHqldCez1n4GRlqJ1XSsuDwx9F8RcQZcbNgRKLKM3a55OPsEcNf1nNOjeXCe
         RVsHj9g37jWLuDyDfbwcaeSXb4VBQzKaLCyn09aKjT8A31WGargKkOcCcJVEArytga74
         rB6ZLLx7yxo7qsYN+aWSDZ5BuBt8qC8TSTcD+1Ia27vn156Qm+5ZZ11rEDg5B8KGH9uX
         rQLg==
X-Forwarded-Encrypted: i=1; AJvYcCUWUYDDKze+AKWd2+q++HOPNgrEAo+QP3QkQyhTOaihRz4sn+jE4lDUfYyKUoqduL1WlFfqS10um0kEQjpVORoogg==@lists.infradead.org, AJvYcCX6m0XuhWzzeC00DfiKASRlYX8UmerZIzPgwUPoSUg0ThBs8pYjUrhgmBvr71IWF5TUUvh1R16MmJGfW9ERcOY=@lists.infradead.org, AJvYcCXoJ6aWMvzlNwoPx78f3dijISjSmfX1tOoI+LBJfB1GDAsNCHqVAbTqzAaRXa8Q70yvuvyg9a6PEKOIFTxA6G+p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg93eaizaHvkpb25VrrwbHoVzURCuKY4S7VXc0jStBp1YtqBL6
	0MOuwVLaH5ppa0FGrUhN3ZQBi3xh83dd8jYDi3vQZq6nHuz7g7oF
X-Google-Smtp-Source: AGHT+IE61r7LzTueKUQlFdoI5wEeGAqGUwYYiMrtwf2Mv0pNQVPEzR9fOanjd9e8cCB88vfjJr2CIg==
X-Received: by 2002:a05:6a20:ac43:b0:1d6:97f2:71b4 with SMTP id adf61e73a8af0-1d92c4bac83mr11107951637.1.1729397368861;
        Sat, 19 Oct 2024 21:09:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1313988sm493398b3a.22.2024.10.19.21.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:09:28 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:09:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] Input: twl4030-vibra - use cleanup facility for
 device_node
Message-ID: <ZxSCdYPjv13Rv_JV@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_210930_027945_7C649834 
X-CRM114-Status: GOOD (  15.80  )
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

On Thu, Oct 10, 2024 at 11:25:55PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code by
> automatically freeing the device node.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/misc/twl4030-vibra.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
> index 101548b35ee3..b8ec5c7c5bce 100644
> --- a/drivers/input/misc/twl4030-vibra.c
> +++ b/drivers/input/misc/twl4030-vibra.c
> @@ -165,15 +165,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl4030_vibra_pm_ops,
>  
>  static bool twl4030_vibra_check_coexist(struct device_node *parent)
>  {
> -	struct device_node *node;
> +	struct device_node *node __free(device_node) =
> +		of_get_child_by_name(parent, "codec");
>  
> -	node = of_get_child_by_name(parent, "codec");
> -	if (node) {
> -		of_node_put(node);
> -		return true;
> -	}
> -
> -	return false;
> +	return node ? true : false;

This better expressed as

	return node != NULL;

I made the adjustment and applied, thank you.

-- 
Dmitry

