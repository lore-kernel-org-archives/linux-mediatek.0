Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86715CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8veHhjJbJX7EX3K1foTAmSCtjo8oJjaNcBdZ+c88gEs=; b=TpPCQ6u9H2A+HRWKmUKWURlUyM
	JVXX0cuE3xJunZ1YaXo0s+WYRHOagDRY64DSwSr75VE1ypgaVYnL3ZpbpegOH9xQVswgSetTHdjFs
	se4IcbmB21vHZWS/YNBeZS347i6HnCkHiLU/sOuchKlbL46DTK+usws9zhz3QJ08IUR+N4Xc8nJkk
	ZA/fZkndOn1OU72CCJbIxw92PtPkvTpKhJbKFXiOH2Jrl0qOu43jSzys2uF6AMJWgNF91pj3d7L9B
	xMDuZFr7d+S2F8q4RjIk50IA0pd7pL3K6L8roKE3Srr/1rfmWrZWqKVGVawRh6mi1Uy6EKp4LXORZ
	OLBZ+mVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st3u7-00000002CHf-2Ql0;
	Tue, 24 Sep 2024 11:40:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st3rf-00000002BlM-31q4;
	Tue, 24 Sep 2024 11:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727177874;
	bh=HL+IJGvaPoYFWnbwstJlsZ+C2p9dZZSdwImP0j4Q+2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W9b7sxjjLGQQX/tO6qWHLxOd6mGb3NzsoNvqpaV4Ve+SCj/ZHb7qw772sM3TRNNUJ
	 WklzCbkTRP32y+X8sND1JSnBfXce4jyeyh1R780DNuA2x5dO3vM1KI7g68u9huAJva
	 Sn3TPKTx41FgYSR+OZT1O6RuwYpMCj8tB+Uu3bXPRDVWursmJ4QGHDWaarhg9xbThc
	 /SXbadtQVTbvTe1o8SdPviC9wUsaACeIf66hvcoHsNIduFdnVQQ8N4SbOhQiu6NQlo
	 lJIAtvxoLAceu73B9vsbFdaA+Pn0nrgVdyJznELi0ZJDC6fL/uyS10wnNNnM3iKR63
	 QKYSiyNpEfa7Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A41EB17E1245;
	Tue, 24 Sep 2024 13:37:53 +0200 (CEST)
Message-ID: <2a74df47-c393-4a3c-bbc0-332c716c9a81@collabora.com>
Date: Tue, 24 Sep 2024 13:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8186: add FHCTL node
To: Max Weng <max_weng@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240924101559.879167-1-max_weng@compal.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240924101559.879167-1-max_weng@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_043755_942748_6BEADA09 
X-CRM114-Status: UNSURE (   5.78  )
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

Il 24/09/24 12:15, Max Weng ha scritto:
> From: max_weng <max_weng@compal.corp-partner.google.com>
> 
> add FHCTL device node for Frequency Hopping and Spread Spectrum clock function.
> 
> Signed-off-by: Max Weng <max_weng@compal.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



