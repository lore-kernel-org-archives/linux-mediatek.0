Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36321C54FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS1GI25UBBfYtuxvdyLQ3wxOjBGpXsX+OqtV+gpjsmQ=; b=c2V7gdFjEhKBEcdPG3hC64RurO
	b9OfYjgrME1WGEWSqQd94KzKRwBuqmShSdQHJVR/ix4592PMTTPMtT+O0QCkhb1s78UCuabz3MlvR
	q42Fftgd3n5HsGEJmx7y/qXMUWFsaphmuZRqaIlmpKhjDKmyAbGaKz5W8r4RQZ5TZL3wUTu/1cw9N
	mMSlvjsgE+IB9xDyk3QyATZ7oFHatbfhSuDyDbQvDdcj+qYtEf7qWeB1503uIJC7cpRCcpYAs5eNF
	uMPQctPa/CqnJeCRY7jNTDr6fE0dku4OXL7Pdzhwdxm/6y/WfRfw7cD679nM423Rgi3NTi+xOCQoP
	U/g+79zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Y5v-002uFS-0y;
	Thu, 16 Nov 2023 08:51:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Y5r-002uDl-0r;
	Thu, 16 Nov 2023 08:51:24 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BF9826607337;
	Thu, 16 Nov 2023 08:51:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700124679;
	bh=DqmuAspJuC+u+5khGNbyPkSM/AWgBnoD3ON+vRqFxEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hbry3TeNmf6wo2GjK0QRPFfwYDol5mVaFG2MbMZ46WWBur37/LA8NpOwX+lDw6cni
	 FKJGb78WRqJCgLwCoKEREKKmYHJTj4qE1DituBAp4vTYBAgvyTcLcQxmYrpUZyCohn
	 Dm8fBdXNjvw31+mnNLqextpgegosAjzMl7Mrwh5fazOIJk0b4thYtc8SQKNPsPzsxw
	 hZ0FGYZxUx5rj2+v9+AqFUdmHhv6Bo+tqIUVKak64ENpiLUh7pNRAq/+Z9kxupyJ8K
	 Lriny8urjvLYhmmzyTHZ8i6hlQYsxRFZIqanA0zLhdbSgmeWcK5NFNea0ocMK2bKyq
	 YDhhP1+vPSHNA==
Message-ID: <ca7be6c2-d3b4-42ca-bc16-b8cc88a5a832@collabora.com>
Date: Thu, 16 Nov 2023 09:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: mediatek: mmsys: Add VPPSYS
 compatible for MT8188
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Garmin Chang <garmin.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
 <20231116080129.20617-4-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116080129.20617-4-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_005123_463330_D7CDCD70 
X-CRM114-Status: UNSURE (   6.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/11/23 09:01, yu-chang.lee ha scritto:
> For MT8188, VPPSYS0 and VPPSYS1 are 2 display pipes with
> hardware differences in power domains, clocks and subsystem counts,
> which should be determined by compatible names.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



