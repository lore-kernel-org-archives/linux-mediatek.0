Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E31CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 07:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zk6yUkP6W1rULwKkjyUHjYr2nx3DKKi0BVPn7REXL4U=; b=b0N5R7HoMFbKGngKK6h4gumaDA
	ZDZ4gmtgpyKjwAUKwpJnVdE7Eg8h2nKfl9RQ0CSWD9u2mlhP/sa5GmfI7+RQy/bjFGOuUWv62Xv/D
	9p2GV9hlY/FcgCkmIM+8TQqAWMkjV2cBsdERLLWmU+xYZpGFPMkMD0in4xvf/idWliSiAWmA0pwPC
	KxW5kCTgj7fS8DBxFQRpo72I7Gkvn70oLPaUhlBe/5jocPp+Z+/S93bv/eC7MkzY/GFLVm1wtyvVw
	+VzGDgFUa47yMd4p7e+5qTSSuk5VCoNeO/A0J9FCIbk2LIGQRcH0f8poCCPkZK93vdZ9+jp3yt4xj
	RE8b7WbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrv9k-0000000EYET-10d3;
	Wed, 03 Apr 2024 07:35:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrv9h-0000000EYCL-0bif
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Apr 2024 07:35:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-415523d9824so41196165e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Apr 2024 00:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712129731; x=1712734531; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zk6yUkP6W1rULwKkjyUHjYr2nx3DKKi0BVPn7REXL4U=;
        b=RHv1Ur8iRa1oJcG5/1uhdV26VfIW9ohbjPLIE3O83lmMMkekGX+TTiDUo2P6RlQmJp
         u74A4rZbmyd8DPLL6zLbGx3fpuZdzzq8/Zofu4j+WDOb2fc7VRE3yRJu9VCKEe0ef80t
         mMtg4Er1uzIRf0FAtVPZdg/ApknELufBhxG0tXNuH320OG5n+95A7TUmYDmDNAYlwngI
         dSOgkDb8P6/E1dg2c3sb0+4l94hTRfFRAqX07EykCqyZ+Vxhj3dxN3MS2WucZTBDp0K6
         RWAaPe501MNRGUYJBenPIPU/BGj+Ki9032fuICb0Cx2So3OGyLn6WClcv418PyBoYxmI
         LMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712129731; x=1712734531;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zk6yUkP6W1rULwKkjyUHjYr2nx3DKKi0BVPn7REXL4U=;
        b=C9yqo6FoFRmtwYLcTvbr0UM+2OorRv5RpQZI4EXJJQ+jQVWjgu266c/wn0xJM1PgpE
         1zTKdl9w2yCB9BQxAc96y410KOoNXdMr5CWdpdhH2IX4LtOAYM5rN9QTeJ/4uFbobKRx
         SGaMUuLdDzZOzjUR8JyY+46TGL4Gtl26/z8+YZ+rlJLNA0WY4fVr5jvBE44jQAQ9hE/h
         Ly+v7E7Fs1K0oseJAe0eL+yykTYVFYJgZOmbcMsI8JgAKjSTXS/jLyeFvNBl4QZBF5tT
         gOfdv75J5cxzG4vMbQW4yfKJ05xrSm2a3yex6aWEARVq6BUZ50lglsYs4jbx6HERHw64
         iRHw==
X-Forwarded-Encrypted: i=1; AJvYcCWH1kk27PqL9FKfMK3CsqYaSa1E8gzC+fXBWeBn1DIsP0kIEUTcZR6VLxSKjwlScCKiuu0tOPCTRM9jimwU6RdHjhPul1lK36ffjyzDs2mQ4Jd5
X-Gm-Message-State: AOJu0Yyk9RHrAv0pYog+LcjThAj+PyRe6S4g0aQVqwT4wRBUinrqAe64
	g43M+S0jIDNfEdot/4vru/6/VuNEUWF1PO8JCxX++NAMI17Sx4S+J1XOI3oSl1k=
X-Google-Smtp-Source: AGHT+IHXvAP8cSVNeOWnJluu8rIyEeTJzOcu+0z22O8FJUnGbtq1azSw+RrgCvrNebeugbuXKrMsXA==
X-Received: by 2002:a05:600c:3b26:b0:414:9455:85e with SMTP id m38-20020a05600c3b2600b004149455085emr3363419wms.25.1712129731067;
        Wed, 03 Apr 2024 00:35:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:d6d:8d9b:bb47:c974? ([2a01:e0a:982:cbb0:d6d:8d9b:bb47:c974])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c1c8400b00414807ef8dfsm20792252wms.5.2024.04.03.00.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:35:30 -0700 (PDT)
Message-ID: <43819edb-d65d-4639-80e9-1f3a505c016d@linaro.org>
Date: Wed, 3 Apr 2024 09:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 3/7] spmi: pmic-arb: Fix some compile warnings about
 members not being described
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
 <20240402-spmi-multi-master-support-v8-3-ce6f2d14a058@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240402-spmi-multi-master-support-v8-3-ce6f2d14a058@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_003533_401713_D21721A1 
X-CRM114-Status: GOOD (  14.69  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02/04/2024 14:07, Abel Vesa wrote:
> Fix the following compile warnings:
> 
>   warning: Function parameter or struct member 'core' not described in 'spmi_pmic_arb'
>   warning: Function parameter or struct member 'core_size' not described in 'spmi_pmic_arb'
>   warning: Function parameter or struct member 'mapping_table_valid' not described in 'spmi_pmic_arb'
>   warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_read_data'
>   warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_write_data'
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/spmi/spmi-pmic-arb.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 9ed1180fe31f..704fd4506971 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -132,6 +132,8 @@ struct apid_data {
>    * @wr_base:		on v1 "core", on v2 "chnls"    register base off DT.
>    * @intr:		address of the SPMI interrupt control registers.
>    * @cnfg:		address of the PMIC Arbiter configuration registers.
> + * @core:		core register base for v2 and above only (see above)
> + * @core_size:		core register base size
>    * @lock:		lock to synchronize accesses.
>    * @channel:		execution environment channel to use for accesses.
>    * @irq:		PMIC ARB interrupt.
> @@ -144,6 +146,7 @@ struct apid_data {
>    * @apid_count:		on v5 and v7: number of APIDs associated with the
>    *			particular SPMI bus instance
>    * @mapping_table:	in-memory copy of PPID -> APID mapping table.
> + * @mapping_table_valid:bitmap containing valid-only periphs
>    * @domain:		irq domain object for PMIC IRQ domain
>    * @spmic:		SPMI controller object
>    * @ver_ops:		version dependent operations.
> @@ -232,6 +235,7 @@ static inline void pmic_arb_set_rd_cmd(struct spmi_pmic_arb *pmic_arb,
>   
>   /**
>    * pmic_arb_read_data: reads pmic-arb's register and copy 1..4 bytes to buf
> + * @pmic_arb:	the SPMI PMIC arbiter
>    * @bc:		byte count -1. range: 0..3
>    * @reg:	register's address
>    * @buf:	output parameter, length must be bc + 1
> @@ -246,6 +250,7 @@ pmic_arb_read_data(struct spmi_pmic_arb *pmic_arb, u8 *buf, u32 reg, u8 bc)
>   
>   /**
>    * pmic_arb_write_data: write 1..4 bytes from buf to pmic-arb's register
> + * @pmic_arb:	the SPMI PMIC arbiter
>    * @bc:		byte-count -1. range: 0..3.
>    * @reg:	register's address.
>    * @buf:	buffer to write. length must be bc + 1.
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

