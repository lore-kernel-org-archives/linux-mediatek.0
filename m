Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FECC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 21:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTQBXwI0G6Bgw7Du/leYyWHaX1tBsVU/otm+wwUaHEI=; b=4ICzbGcnNTsfpRQO1KWUPLyi7b
	5dPIOFMLpbH8vOv8u/4fma2hoEAPfpPJnQDruoDIpAenwWOQqQilO4TUu4X4Yqj+yMEknMmYyKRIt
	wMjrotf2P3Rwox0eDMNilnmycYEnCw9stfayJhstN6C4gpF1uIJjJMyUwQcpf9Z03jXHlhMZXfoiM
	UOA3wrU5LaaYOFlvvBmT71ANMsFTvkTOz/mX6EV8cIWxLNm5FqMKkBfk9vdtnZNt7V5gtrwWwCY+s
	z65KfKTEgyxKjKAEO5uIxv2bfp8DhqeBlBm73nya3fDcN8bEYVeb5YNHQ+9MnwOWkArjPJNky52Om
	Dx7WBOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAGwh-005gaI-2g;
	Mon, 04 Dec 2023 21:57:43 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAGwe-005gZe-1w
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 21:57:42 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id AAF2F34006E;
	Mon,  4 Dec 2023 21:57:35 +0000 (UTC)
Received: from [192.168.100.159] (50-251-239-81-static.hfc.comcastbusiness.net [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 1B51713C2B0;
	Mon,  4 Dec 2023 13:57:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 1B51713C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1701727054;
	bh=YL628h7K/5M+EdyCbLFzVox94gVS0nqqnuGkK8VQVzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bV+7ca6P3EA0qBntWgUSlxDJQEqgZ+Wje1tXeIH+afYoje6N0fcB3z8W9e77xHCG1
	 O69IQMPhc5jY3pP53m4P1mh79TzO7KnE9/+cPQGr+wx8g4WsvkPSnBGYIuTjI9s7Xq
	 r27SDOENR83j9cDBPkqa0X3UXvGR1CmVa/1KzSlU=
Message-ID: <ae3f3bdb-0de3-e15c-f447-6d1d33478051@candelatech.com>
Date: Mon, 4 Dec 2023 13:57:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/8] wifi: mt76: mt7996: switch to mcu command for TX GI
 report
Content-Language: en-US
To: Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Benjamin Lin <benjamin-jw.lin@mediatek.com>
References: <20231102100302.22160-1-shayne.chen@mediatek.com>
 <20231102100302.22160-4-shayne.chen@mediatek.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20231102100302.22160-4-shayne.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1701727057-f0WhdgNOBJci
X-MDID-O: us5;at1;1701727057;f0WhdgNOBJci;<greearb@candelatech.com>;dbba72c6a891d3e8767bcea3b0305f22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_135740_750672_A1870944 
X-CRM114-Status: UNSURE (   9.95  )
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

On 11/2/23 03:02, Shayne Chen wrote:
> From: Benjamin Lin <benjamin-jw.lin@mediatek.com>
> 
> During runtime, the GI value in the WTBL is not updated in real-time. To
> obtain the latest results for the TX GI, switch to use an MCU command.

Hello,

I do not see this callback happening on my system.  What firmware version
is needed for this to work?

And where to find it...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



