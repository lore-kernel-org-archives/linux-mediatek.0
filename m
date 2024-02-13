Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CEDC48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyULzsF+PCPr3bLPUsuXAABJpQii+iHiCCazp+x9FKM=; b=cCDiYMrxS2sOo75DGFc9R0r/uy
	vqDBN9/oPfFB4sFPm2c6uLKkoO2lIU8KNe9DYBEoDNWGTQGnMFE7irj4zpSOGsD189lhRvyHwtzpe
	DRl226E49/qWRW/SM8oGYbVGwt7nAw7xkE7m13Y1g8JC36LvHLOo5GcDdMjcdY3lSSPL96j7LSN10
	O227Y5CYL3A2WaP89TwVIRq00AKiWmtcUBhEfpQcyJXe/GEkjoBJigeFDaYajVQDxCCogSw2/3DVf
	OPQ7rnQw8sKwYOBuEHm9lN8HTaWi7qnQAejyqtUJWMHB6YbC1r9QOYseisYHi1PGj7+rIVDcYDvOL
	Fsx69hYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuCa-00000009byA-0Z9S;
	Tue, 13 Feb 2024 14:56:04 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuCX-00000009bvT-0ip9
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Feb 2024 14:56:02 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d10ad265d5so7368951fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Feb 2024 06:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707836157; x=1708440957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyULzsF+PCPr3bLPUsuXAABJpQii+iHiCCazp+x9FKM=;
        b=gsknVL4t7VLApf3NMYxm2JbtTwA8kZXwvU+dORV2NZeNm5c6HKv3Fgc6AFiTnluA8K
         pNW+/hyiCsH6uMpqBfN73GtPUqWWJawqpGwzffuHbebdJgd3G0BqBVEAV10zKTGdUtQc
         JtnMmgwejoLa10pNEZOil2z32AWjw9fS1mYPNP7bcrF/2bpSvMBV+K2hJHqjdZ7UQAdM
         0Ybei/K5bmVTLohyjbCDCm+WmFJtCxrWhFRD6yyfwsAZw9tZKzHJkgHE1nB6ywQ2+a6k
         QyBesnV8Wv0dJloVOYnQxXN+thWk5whD+vhjfA9p81782C6nbjPauIg4Ts7HDNEbreiI
         /jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836157; x=1708440957;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tyULzsF+PCPr3bLPUsuXAABJpQii+iHiCCazp+x9FKM=;
        b=EwW632HleRdIJhrnH6IGrs2j4DdVPwHWp3VqPzc6KUK0aBTglsWT+TdkPtyK5XtTb0
         rvmulfidy0xDpmFJLDweB8FArq3Y6uE6tMIYU77QBuwcnFVgL2T7D1WzZ/+vMalTYB9n
         sItZaTMQY3fCBzPqQO778uvUySx1bnrNqtMbBvc+Yo8seLUeXlmyjWX+heEL0pRERaIg
         ++R3Wrwxx67oJKTB2D8z760pUaZW9TvRRJRh+2ad3mMFiSfKNUzNlVtJ1WAEAhgsw5vW
         3xIuk3/iI1snH09eONpFNkcHIZRPrd/gr92jQFOp5tzj2VY6yvy/ZjXRuRenYyMr9pxz
         Ueyw==
X-Forwarded-Encrypted: i=1; AJvYcCW12kRf7Kr0wTQ19XzOTw3fDUGz/8kB0bGLKDuQ1d7EVO3PBCikwR5/G6i5bkQ7eKehmVhK75s49NiB//B8AhWbjutK+PN4+HzLj2m94FGMHIt+
X-Gm-Message-State: AOJu0Yw+drS44ZhCT0DlBkOaTPDlrwvZ170Ryy+dRWZtgrGe+JsF7au/
	LKHVzVrNMTh0yJ/dAMOWZy3sjjfOD9Y5JwnGtudlZ+qYl7mLBtKcrCvfum2puic=
X-Google-Smtp-Source: AGHT+IEJCO0191MmfYiLczJH0jtOt3i1sjwtrPWFnSTEsob40TAFOJo5Gn/yIPKs5y82EJc87GKl9A==
X-Received: by 2002:a2e:9a83:0:b0:2d0:a4f7:11aa with SMTP id p3-20020a2e9a83000000b002d0a4f711aamr6763639lji.41.1707836157531;
        Tue, 13 Feb 2024 06:55:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEytTq+rKwG7mGlC1anzHlgZi4NtoC9XUXwYJwkoJQSu1uW46zONAmiTLzr6Alaz4/yLqDf7lksuvBfJHvkiVaInwni84l7hXR/yOIf9mFW1w1GDkNipdGdUKf7fm3MP8xW6wY5TpPMl4wTomivGfj85UG/0BlaUmjKGeJswRosgiX25NaFLE7k9NWemX8IRDKDhI1sHKuQpQkGsRH0XjpmrIO74O4NcTErM7uO3WzT/5HOXT1qJkIbTcvlPD36wVVbumLhcPtGn5Rx75xrf/p/zC21aK3uL62np9r8eXQHsdKz7KIdWrxiq5b/hPgoypek15+NbIs8mkRM/G9ebS1Z8ZOMZmGof1tHEr9ZRhT/WIxN5fN1fl4dsfcbGrYfjO9VeiHpQ++Oy82hv/WOAXUqjPGLNNNtzm+urcsJMMJKn6NQOqQHxq+IegvOrVMz+qXzfra8g==
Received: from ?IPV6:2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b? ([2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b0040fdf2832desm12195850wmo.12.2024.02.13.06.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:55:57 -0800 (PST)
Message-ID: <3fcb9f16-61f8-4544-a319-20496d5eb106@linaro.org>
Date: Tue, 13 Feb 2024 15:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v2] spmi: pmic-arb: Add support for multiple buses
Content-Language: en-US, fr
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240213-spmi-multi-master-support-v2-1-b3b102326906@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240213-spmi-multi-master-support-v2-1-b3b102326906@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_065601_263929_FF377402 
X-CRM114-Status: GOOD (  27.85  )
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

On 13/02/2024 15:41, Abel Vesa wrote:
> The v7 HW supports currently 2 buses. So register each bus as a separate
> spmi controller and adapt all ops to use the bus instead of the
> arbitrator. Legacy mode is still supported as long as there is no child
> node that represents a bus, instead all nodes are expected to be actual
> slave devices.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Reworked it so that it registers a spmi controller for each bus
>    rather than relying on the generic framework to pass on the bus
>    (master) id.

Thanks, I think this is better.

> - Link to v1: https://lore.kernel.org/r/20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org
> ---
>   drivers/spmi/spmi-pmic-arb.c | 950 ++++++++++++++++++++++++++-----------------
>   1 file changed, 585 insertions(+), 365 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 9ed1180fe31f..eced35b712b4 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c

<snip>


> +static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
> +				  struct device_node *node,
> +				  struct spmi_pmic_arb *pmic_arb)
> +{
> +	int bus_index = pmic_arb->buses_available;
> +	struct spmi_pmic_arb_bus *bus = &pmic_arb->buses[bus_index];
> +	struct device *dev = &pdev->dev;
> +	struct spmi_controller *ctrl;
> +	void __iomem *intr;
> +	void __iomem *cnfg;
> +	int index, ret;
> +	u32 irq;
> +
> +	ctrl = devm_spmi_controller_alloc(dev, sizeof(*ctrl));
> +	if (IS_ERR(ctrl))
> +		return PTR_ERR(ctrl);
> +
> +	ctrl->cmd = pmic_arb_cmd;
> +	ctrl->read_cmd = pmic_arb_read_cmd;
> +	ctrl->write_cmd = pmic_arb_write_cmd;
> +
> +	bus = spmi_controller_get_drvdata(ctrl);
> +	bus->spmic = ctrl;
> +
> +	bus->ppid_to_apid = devm_kcalloc(dev, PMIC_ARB_MAX_PPID,
> +					 sizeof(*bus->ppid_to_apid),
> +					 GFP_KERNEL);
> +	if (!bus->ppid_to_apid)
> +		return -ENOMEM;
> +
> +	bus->apid_data = devm_kcalloc(dev, pmic_arb->max_periphs,
> +				      sizeof(*bus->apid_data),
> +				      GFP_KERNEL);
> +	if (!bus->apid_data)
> +		return -ENOMEM;
> +
> +	/* Optional property for v7: */
> +	of_property_read_u32(node, "qcom,bus-id", &bus_index);

Not sure what bindings you plan to use, but this should be the reg property.

> +	if (bus_index != pmic_arb->buses_available) {
> +		dev_err(dev, "wrong bus-id value");
> +		return -EINVAL;
> +	}
> +
> +	index = of_property_match_string(node, "reg-names", "cnfg");
> +	if (index < 0) {
> +		dev_err(dev, "cnfg reg region missing");
> +		return -EINVAL;
> +	}
> +
> +	cnfg = devm_of_iomap(dev, node, index, NULL);
> +	if (IS_ERR(cnfg))
> +		return PTR_ERR(cnfg);
> +
> +	index = of_property_match_string(node, "reg-names", "intr");
> +	if (index < 0) {
> +		dev_err(dev, "intr reg region missing");
> +		return -EINVAL;
> +	}
> +
> +	intr = devm_of_iomap(dev, node, index, NULL);
> +	if (IS_ERR(intr))
> +		return PTR_ERR(intr);
> +
> +	irq = of_irq_get_byname(node, "periph_irq");
> +	if (irq < 0)
> +		return irq;
> +
> +	bus->pmic_arb = pmic_arb;
> +	bus->intr = intr;
> +	bus->cnfg = cnfg;
> +	bus->irq = irq;
> +	bus->id = bus_index;
> +
> +	ret = pmic_arb->ver_ops->init_apid(bus, index);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
> +
> +	bus->domain = irq_domain_add_tree(dev->of_node,
> +					  &pmic_arb_irq_domain_ops, bus);
> +	if (!bus->domain) {
> +		dev_err(&pdev->dev, "unable to create irq_domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	irq_set_chained_handler_and_data(bus->irq,
> +					 pmic_arb_chained_irq, bus);
> +
> +	bus->spmic->dev.of_node = node;
> +	dev_set_name(&bus->spmic->dev, "spmi-%d", bus_index);
> +
> +	ret = devm_spmi_controller_add(dev, bus->spmic);
> +	if (ret)
> +		return ret;
> +
> +	pmic_arb->buses_available++;
> +
> +	return 0;
> +}
> +
> +static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
> +					struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	struct device_node *child;
> +	int ret;
> +
> +	for_each_available_child_of_node(node, child)
> +		if (of_node_name_eq(child, "bus")) {

It seems you use "bus" subnodes, it seems you should also submit a new
bindings scheme for v7 controllers with subnodes

> +			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
> +			if (ret)
> +				return ret;
> +		}
> +
> +	if (!pmic_arb->buses_available)
> +		ret = spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
> +
> +	return ret;
> +}
> +
> +static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)
> +{
> +	int i;
> +
> +	for (i = 0; i < pmic_arb->buses_available; i++) {
> +		struct spmi_pmic_arb_bus *bus = &pmic_arb->buses[i];
> +
> +		irq_set_chained_handler_and_data(bus->irq,
> +						 NULL, NULL);
> +		irq_domain_remove(bus->domain);
> +	}
> +}
> +

<snip>

Overall the patch is __huge__, could you split it ? Like move the bus handling
then add the multi-bus support in separate patches ?

But first please add new bindings first so we know what you expect from DT.

Thanks,
Neil

> 
> ---
> base-commit: 445a555e0623387fa9b94e68e61681717e70200a
> change-id: 20240207-spmi-multi-master-support-832a704b779b
> 
> Best regards,


