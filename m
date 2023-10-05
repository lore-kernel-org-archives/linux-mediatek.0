Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1BEE8FDC8
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxO0mcE803M1f4CoYOTIE0wlJZbj49xnTxhps/6wplw=; b=h0lRiAnTM4wf2PlIPAyEnhBiO0
	aevBIGzIdF1JLJBY16o3SvjQY5QzQbVOrLYJrW0ZMtkXeL/iaLcbiGkCk8cMSIKGVLU7+XaZ0nFkg
	1ruQZUi1JQ0D7ehFheBVxTKzrLxvVHVF6VFT22xTN+oH7+sTrBSLuOpd98w4xhtcPUu2Pk6uHWRnb
	+Vn56Hk2QsgA9zLWSsMHLzapqIdVFophIIQlhDrWjJQShyYWIN7sb1/A/nF6dA2nhJCns8XfwigsF
	Q8lbfqp6TA23kYHtVi0UOWlwBlfvkukKXXN72B39MbPIQVMBnUVSNoYMaM35ikEUtAzsQXEFdiJl6
	wjIoVzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLTO-001sow-0Q;
	Thu, 05 Oct 2023 10:20:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLTJ-001snX-32;
	Thu, 05 Oct 2023 10:20:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B58C7660731C;
	Thu,  5 Oct 2023 11:20:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696501238;
	bh=gtShXwSvNgcZvx08zMfHtG7ILqlH7jFASuzzPiQpLPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LmyoZxlvxhWUxUVTDQnppkA5Iu3cWn6/tGSFPwsUJHX8fLXTfRmxOLlVBuF9h9vLf
	 +iM0l0oQw1B8URqd7+da9jI8QgpgVfPOk0X57GSH0ADILQfC/Hl9GHzbPaTcuI0vha
	 9GVotVohyea8Q6E+cx9n3Pm288TFIbbavhipoZ+YcKRedXsXoBuzx8tTTok6/nweFN
	 bsMLVtIWuLqUjZt61Spps4t2XPOM1gJPhs2byvSJR6xw1IB2G/FK9/uo6hcpHsWtr5
	 W67BfPbHUaHxy6zBJWj++QKvwYtByXi09WhpKxvE2f16miqVx93Rc1j3wH+JIP2nY9
	 /Bp8h6B0PSRIw==
Message-ID: <12c2a112-b69a-99ce-227a-eb1e8c539a44@collabora.com>
Date: Thu, 5 Oct 2023 12:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v8 0/8] soc: mediatek: MT8365 power support
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230918093751.1188668-1-msp@baylibre.com>
 <06f8a769-1845-ea87-dcc4-37dd5ad255ed@collabora.com>
 <20231005094316.nj5w6cmefvc36tbl@blmsp>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231005094316.nj5w6cmefvc36tbl@blmsp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_032046_201602_32C2C59B 
X-CRM114-Status: GOOD (  14.32  )
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

Il 05/10/23 11:43, Markus Schneider-Pargmann ha scritto:
> Hi Angelo,
> 
> On Thu, Oct 05, 2023 at 10:54:16AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 18/09/23 11:37, Markus Schneider-Pargmann ha scritto:
>>> Hi,
>>>
>>> no real changes in this update. Rebase to v6.6-rc2 and according change
>>> of directory.
>>
>> Since the driver changed to pmdomain/mediatek, can you please change the commit
>> titles for the driver commits?
> 
> As far as I understand Ulf applied the series today and changed the
> title as well:
> https://lore.kernel.org/lkml/CAPDyKFrUbWBQgMm6wYwFfybiRQKhBpwH7wwcXaT+KrQJLevq3w@mail.gmail.com/
> 

Whoops! I didn't notice that, sorry!

Cheers,
Angelo


