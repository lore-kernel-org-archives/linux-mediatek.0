Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C44C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDqo8N8PDLsr58D+dTMDOCUBQJZy8wGgfaesb6JaW4c=; b=qKEI5OGQpEMBCTEJUTJbL5iqb7
	sPieBvCZSJCCc2yF5dWEvZIY//IlER6+FbeP8IT02aVzcBxoAMsXafHvaGxF3R+FnIivxF7HHq2r9
	Qy7Cx8q/dtqdqxP3VqW0b3WbJzq2JthaXgsUCK6WRChA83g9VG9gwZ6qjqJ7ODp/qQNScOxvAtPBV
	IwA7nh8EJE258L18hk+mj4QmkY396NWJvW/wgYqPwIpTpPNpncHHU8lS3/Tk725c2n3NfSzeKcFIi
	BajOP61hEYlYuyJ9/gMy8Qyc/oy/sr9mpFjcezvZHscez8y0V5myp+qboJOfyFHcAFCd3uoKMkt58
	zuMenVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3eg-006ARn-Jd; Fri, 03 Mar 2023 11:32:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3eU-006AKU-RP; Fri, 03 Mar 2023 11:32:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EBB336602FAE;
	Fri,  3 Mar 2023 11:32:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677843161;
	bh=FJ2VuMBswXhk3Wzx169B+sAbNsLCSe/NF7pcdBeZaPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VGCEdv0t/4ta0/wp6JIzOi4B13PZT6BrQDUCVtjB5u02jgLVA++Ow/WTQaOO9AK8n
	 Gw9HVhzMlqhMMj1x1Dt7Gn0dya8Lp4AxdFqeOSMBWCEpVOeCISj6BqO2A/2zcnsX8+
	 wye5gSXWUOHSYnsK6+w/vwMz3iz+wqh3jztSMkDVppTutlA9StApSJ1l61qgJ+18DH
	 0kza7PfXWIywCWTOSNhWgH8EHzoKvzj0hkZCNfaS6VwkPPkrHSiV/tUTpJcTfPuG3T
	 IlDUqivJ9WRrcuI8kolu0QRKjLN8qztbTN/bLF1tjGDjsRgsiCq9xmHrlBqHs2SOw8
	 9vrVkZohQ31ag==
Message-ID: <abe2f208-4453-7ed2-5c9a-0967124d976b@collabora.com>
Date: Fri, 3 Mar 2023 12:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 6/7] arm64: dts: mediatek: mt8186: Add GCE node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230303031728.24251-1-allen-kh.cheng@mediatek.com>
 <20230303031728.24251-7-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230303031728.24251-7-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_033243_060547_81C53D0E 
X-CRM114-Status: UNSURE (   7.67  )
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

Il 03/03/23 04:17, Allen-KH Cheng ha scritto:
> Add the Global Command Engine (GCE) node for MT8186 SoC
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



