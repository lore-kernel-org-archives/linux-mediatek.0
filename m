Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6B6EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9Bubcc7cmdDFLG9WteD5OYU4srO2bDqxu1Z3y8AK7Q=; b=oLdt9668RhQB8npxKUdtvutn9R
	kBgOh/fyNHN4BaKw9BI8yui7InM/am/ohm3TpI3IvHb1+E8HdUb7Pzm2Ng1bZdrxqUKgSKTCyADxJ
	SXevvK+NmqX83X96LstwWtzkVNvtFRQrWZvkcJ9lQwohUsDeHado9l+UsLUTy6s0GcKLy5XMnIYv/
	8wn77GHoZ58P9oS3OBnziy5uuN2Ghar941EiCDCdcADm0zxnWT/P9SlZv6vh4r598CyfZz8v9fYZs
	CA6AiL7aFnw4O9jr6gKOg3Dhi2rb2VGaYIggREnERUjH9iGw7dSzLIQNjC8NKWPK7Bng5srQQKAgR
	8e/6dpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgCC-000VBv-2r;
	Mon, 11 Sep 2023 12:39:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgC9-000VAi-28
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 12:39:15 +0000
Received: from [192.168.1.23] (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7697366072FE;
	Mon, 11 Sep 2023 13:39:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694435947;
	bh=MvnxIayMmPEsq2MzqcxVyvlilHrYAvXUGbuaSX/LxBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LZ1l9Qf8rixIpz+94pqn/E7NIehaqLf/Jh8WJCYZmTcCqgTQa2ONJuqnA67jpdhKT
	 X21KmOmasjXROM25ITuqounnLMzzSCjVDiqgkRV15kt1le7Q9n+vNhRFom03J7M9Zl
	 dez0ecWl/mjrXet7A1BYTCEJOzEqwiiN/nTjyI6asZvlUm/uQIxpTaiZ5ofEePomjR
	 +WL4/ZD/aGiRPfDFYvuWIeQ60STYhgwtQo/TZTdpNn6vdUJmPVUoilr+Wjx/dnSWng
	 vV844qIYFJT5iAViLP2AG/G58VNVknnvHlDgnJQ6FRYCESGBwRdR1iSZJqVm7+wFf/
	 YTI7qV/10AamQ==
Message-ID: <ca518c28-1375-9eaf-ffd4-bedf06810000@collabora.com>
Date: Mon, 11 Sep 2023 18:08:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for usb
 host mode
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 daniels@collabora.com, gustavo.padovan@collabora.com,
 angelogioacchino.delregno@collabora.com, emma@anholt.net,
 robclark@freedesktop.org, robdclark@google.com, anholt@google.com,
 robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mripard@kernel.org,
 dmitry.baryshkov@linaro.org, matthias.bgg@gmail.com, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-3-vignesh.raman@collabora.com>
 <ca53e4cd-1c89-482d-9662-19926efb5b47@linaro.org>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ca53e4cd-1c89-482d-9662-19926efb5b47@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_053913_826902_3E968D91 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Konrad,

On 11/09/23 17:20, Konrad Dybcio wrote:
> On 8.09.2023 17:22, Vignesh Raman wrote:
>> Due to the presence of the fastboot micro cable in the CI farm,
>> it causes the hardware to remain in gadget mode instead of host mode.
>> So it doesn't find the network, which results in failure to mount root
>> fs via NFS.
>>
>> Add an overlay dtso file that sets the dr_mode to host, allowing
>> the USB controllers to work in host mode. This dtso file will be used
>> in drm-ci, mesa-ci.
>>
>> Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and Maxime Ripard]
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
> For such a small change, maybe you can just use sed in your
> scripts to alter this?

This was the initial idea 
https://patchwork.kernel.org/project/linux-mediatek/patch/20230825122435.316272-3-vignesh.raman@collabora.com/

Since there was a review comment that CI should not make changes to the 
source tree before building, we went with DT overlay.

Regards,
Vignesh

