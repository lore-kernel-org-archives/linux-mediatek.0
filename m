Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D0DC35274
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 17:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0tnBmLizhtV85bV989C1Q4/ieQl62idw3Pu9c+Cx9M=; b=AKdYr0OXdu7Dlkr8ORgne75mUJ
	3hdFELuhzvJQpVmNUdv+xyZDC9tt9lzEFnBOY+bZkp35MaMDfyrMZLuoFc68mFRPh03mI++l1KkJ/
	ZJjhlyF/w0pjcLCEV/N7kyE5MdBJWy+MLX9zOBzj8gwmZ6J6p6KpD/sLCyrTBiGSX2KhekpCxiHSK
	AADPM7zzrX0h9OOqDasYuLBLTC0V798s/0EfZSWaBBxR9m7EPuV5anTI1BOJC1K/uRkhos3RFamNS
	IGVFOPWptk7SfBm7eefonCMBS+C1zaTs8R8hcfO3O3ezM7wm9g5xxAtqxWyK7BtEqOM6Dy8ygP3d1
	cWZgTI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rECJY-0049OK-2C;
	Fri, 15 Dec 2023 17:49:32 +0000
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rECJV-0049IQ-19
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Dec 2023 17:49:30 +0000
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTPS
	id E8GSrrXWBWcCIECJIrEUc7; Fri, 15 Dec 2023 17:49:17 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id ECJHr6JrfBOccECJIrCtVO; Fri, 15 Dec 2023 17:49:16 +0000
X-Authority-Analysis: v=2.4 cv=J+25USrS c=1 sm=1 tr=0 ts=657c919c
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=P7lGutExLh3arObF5LoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C0tnBmLizhtV85bV989C1Q4/ieQl62idw3Pu9c+Cx9M=; b=crtf2yisBKNPe9TrXtivlGknCo
	WiKn9uFrv56/hhXNlXfmZMjUyURv+tU5kiJfMn7gYFcFc7PrIA6ud/a3ORBClxFgxjQfZows+bUqp
	/J5t73FuvX4LTNzvLjTBuQaQDW0F2iqJ6uUIpnkbbzQwmZ7rw39BmoPi/isuBO0uUPzt01qVKfpTW
	neWZTSmtucr4UAF7+hBnjhgqNo5BLuTDViHw+jtg6GsdtAHjYrvK5Za/S2DEBDuGa89nKEzqu3pZ3
	kSq/SxXdHo+aC14hNQ5fJBPwcMJgtrphR7ic+ezCO4b8/APQQdiv7nbwNklAGCAAR1PHnNRgEuWKj
	BTgQfK1Q==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:45694 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rECJF-004Kas-26;
	Fri, 15 Dec 2023 11:49:13 -0600
Message-ID: <6681b643-464d-44d9-b01a-420e543d19d6@embeddedor.com>
Date: Fri, 15 Dec 2023 11:49:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][wireless-next/for-next] wifi: mt76: mt7996: Use
 DECLARE_FLEX_ARRAY() and fix -Warray-bounds warnings
To: Kalle Valo <kvalo@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <ZXiU9ayVCslt3qiI@work>
 <170264697580.1759617.6397953788753678096.kvalo@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <170264697580.1759617.6397953788753678096.kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rECJF-004Kas-26
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:45694
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFsFkqk+2iXk2UPNBr/WzDppZEF0tnAmw+iek7j5k8IqztyzBH4qMaDCAY/2U1KyNfHn4pY6TvqsA6f3z5VNQMRRIbwd8LW2zK6QD4Pjwmm4UDF1/o3C
 qzRf+cAd8O3XKMcLt1JVQGa7bBeDPofnkkyE1JnYh0a0OWSKHXPnWXewtaDf4jsCl6WiaufapNq5qgGZGvt5D1rErWedtO6AlZrkv2NZ2N6iv2PeXZyiLo3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_094929_453812_F7D466C7 
X-CRM114-Status: UNSURE (   0.68  )
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



On 12/15/23 07:29, Kalle Valo wrote:
> "Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:
> 
>> Transform zero-length arrays `rate`, `adm_stat` and `msdu_cnt` into
>> proper flexible-array members in anonymous union in `struct
>> mt7996_mcu_all_sta_info_event` via the DECLARE_FLEX_ARRAY()
>> helper; and fix multiple -Warray-bounds warnings:

[..]

>>
>> This results in no differences in binary output, helps with the ongoing
>> efforts to globally enable -Warray-bounds.
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> I'll take this directly wireless-next, ok?
> 

Yep, sounds good.

Thanks!
--
Gustavo

