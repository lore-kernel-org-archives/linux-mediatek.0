Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E52CA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfJ/51iDLeJlbBPwo7ms/iwzQO4N6H7rOqneCthDx9k=; b=45oQlhk2pfnQDfLa+EIsl89aFn
	VgHoqlaeB2li3xYbxD2WW/yDm9ajEjJTUjoQ5y2q8IUvf49tJSOKjnnJICGbx5vw/WJqesSeQdImx
	id0npRhv84QW7e4TNo2pVMCyiVm2IcW1ZW8e8K0aUGpUVrPEOlbPeywbNv2UqifYp/jLCsM05gKmG
	W7d1mNbNBXwK8kbDe2GkrJDGO/F0i/H27pt4Y23QuZqLl87jezoAWrLkzM91GxeZCAEYOvZJ+Iwid
	3aUw/NKOC0avpQOd2VnytF8pCkhXMb1I4mm61sb2A/ofYjCFSo5DXUhIP/3PEQFkQDexPiJk6W/32
	Zb6TWyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv1D-000000068qh-0dya;
	Tue, 09 Sep 2025 09:52:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtI9-00000005P4h-0mVR
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 08:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757404887;
	bh=4UxeFMW9X07zobckfuhD8yCpJ07mc4o6RlRFftvs/mg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=al3PABxvx6VzQYkvXTpkYbj8oloeiWbc0xXNzEF9qgBClQY81V2zJ2EjMI5Bu7/kW
	 XZSL9e+1i49fI5xfZJHE8e6rxSrQcaD3/HjZJFtxrWc2nVtpmuWuzBC1MOu7lTwqMM
	 6819Mq8RBEmsYmOCezPhaNjB/JdeDkM/Y9uRDrpvQiFhLoUPHhYGwWmYRVUu8TtH/9
	 SdlZLN6DLc4wM+nz3F12zAK/IN3/u5H04IJ2HQKo9yNDt6zRq4YzGT46jv055GE5LB
	 s2rpjALLuM6L3uHbWDvNpWvqvjd+PGAUTbtqdKaZ+sszpcfrZnprbYQR4Zk4zCxfoR
	 INFnFGPFpJsTg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1680517E0C96;
	Tue,  9 Sep 2025 10:01:27 +0200 (CEST)
Message-ID: <26a2316f-d084-431f-a158-8eea66c335d6@collabora.com>
Date: Tue, 9 Sep 2025 10:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: mediatek: fix device leak on probe failure
To: Johan Hovold <johan@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
References: <20250909073819.25295-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250909073819.25295-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_010129_371718_AFD8D885 
X-CRM114-Status: UNSURE (   5.17  )
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

Il 09/09/25 09:38, Johan Hovold ha scritto:
> Make sure to drop the reference to the cci device taken by
> of_find_device_by_node() on probe failure (e.g. probe deferral).
> 
> Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
> Cc: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



