Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8644AC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f30mXRiYu3Zl4+MX7g83JsVH+R3HD8q3KewafFtF9CU=; b=1XUczar2W56c87QW8U2GJ3zZCB
	k+3VzvzGInZybdXAGH/O0CBRIaVM6MmQ/htQppSxic41JuRBoJWxzBRJgzOwTFwSoELQMos5gRcrq
	wYy1j0Ubg/YPpjbBPIuF4YztQ1sB7nSGu/RRHAu5wCMvn0E04oCwqYkUeEy7DXV+iHnYTQtFXnAfF
	t+NmMDjVTqTOJEsONiPzHTHLDMAQr2UlkxMPdN0vTcEr7GPpHY8R2J75C4N0oC6/iA8mNsEsLNcfI
	sE1RDQDeE2eom0pU6EiMCDwN4y148PcnE9KzjNfEwUpJDKEkmksrtW+M/B2iGk/0xtABDxAC4FSo7
	AiDEIjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg3Hl-00000001ja7-1onH;
	Mon, 19 Aug 2024 14:23:05 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg3Hi-00000001jZE-0Ab8
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Aug 2024 14:23:03 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 8C8C2B80067;
	Mon, 19 Aug 2024 14:22:58 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.39.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id B1BEE13C2B0;
	Mon, 19 Aug 2024 07:22:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com B1BEE13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1724077377;
	bh=cfPZIvkFj39IEfSq8vlZ2wpc7MZksqoeS+wQBPZsjpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=onjy1EW0eXhEV1SrGJ0hB+d5/MigRmJtJLOooyRv++lPX3tcVnBILg8QY3L8BYsaD
	 18K1ix0NATMyNyC8qwbvmZDs0NZoSlfOa8aJNlspj9Yzxna5CmZFpqyZyq+QOdROxQ
	 KGvl+0So8KfgHPUbRpWMNK0QDtrC1I1Z20Zd3rpw=
Message-ID: <9e60638a-d85f-4c35-9370-8b42e96d1526@candelatech.com>
Date: Mon, 19 Aug 2024 07:22:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] wifi: mt76: mt7996: set correct beamformee SS
 capability
To: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Howard Hsu <howard-yh.hsu@mediatek.com>
References: <20240816094635.2391-1-shayne.chen@mediatek.com>
 <20240816094635.2391-6-shayne.chen@mediatek.com>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20240816094635.2391-6-shayne.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1724077379-TIxF0z-F69XC
X-MDID-O: us5;at1;1724077379;TIxF0z-F69XC;<greearb@candelatech.com>;6b0fc91aa4a2e8bb560701e503333c57
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_072302_176104_60244A81 
X-CRM114-Status: GOOD (  11.12  )
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

On 8/16/24 02:46, Shayne Chen wrote:
> From: Howard Hsu <howard-yh.hsu@mediatek.com>
> 
> According to IEEE P802.11be/D6.0 Table 9-417n, beamformee SS field stands
> for the maximum number of spatial streams that the STA can receive in an
> EHT sounding NDP minus 1, and the minimum value of this field is 3.
> 
> This value indicates the decoding capability of a beamformee, which is
> independent of current antenna settings. Correct the value for mt7996
> and mt7992 chipsets based on their HW capability.

I thought that if user sets a specific number of antennas, the code should
act as if that were the number of physical antennas, so this change seems
wrong to me.

What use-case is this patch attempting to fix?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


