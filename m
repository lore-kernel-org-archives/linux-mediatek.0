Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB353606D80A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KeNR0Q/b;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ssm+gfrs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIR/cUNa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=; b=KeNR0Q/b9hMqUY
	YDXU0eOtmYE1EZVuCPwJJU4m5UOoTa+/ilGN90of2sj3kKsb6paNoFXYKekhznQ8aAeY/fAStXZGx
	TO7fuEZ7KzeDQ8waehS3vjprbWn6F41cv8kt4Nwrab1nmfZYvEyy6ZsXcsDgUtpdIDMTHHcpK+AJA
	ibTA3ahziumDa+OkDZKYujomp9+fKXpxolHwo+bkLlMkNOUYRa0GZdYx1y1C4UyjYMA0soiWvrQvw
	QHCF6u99UQSZ2m3eM2MkNyRmoYFIYIx4nVSK64cr9STJ4CHuEjYizwNjVLgw4C92qKdZa+iEyMRUo
	7UtuP6+VraussDSATioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPrt-00000000tqS-0TZl;
	Mon, 09 Nov 2026 13:57:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPrq-00000000tpH-3CTo
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 13:57:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFD7U4025853
	for <linux-mediatek@lists.infradead.org>; Mon, 9 Nov 2026 13:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=; b=Ssm+gfrsD1ev3JpT
	ihtLKigOBpwpsIOlBx5QTmYQY4VnX+AKrqPHUInLe30mSrde2HDxKnO3Z2Ns+Ze2
	EO7t5nkRA8o/ot4Z5RFQY53LFNoD0MZPJz7Zw3eTD1KT++R8kiF6N35V2typEA8D
	1Q/lnBh4L1GI0dUIS70i1+q4CCAE6fnkUuezvDVKiCMtXyCBTZ1PB5hoGSCYdSNE
	Douzjg+4uMqPnS/EIRy0czCrtzxmGaPWxIJVpg0UPPcSCVMOUpo2WCgKEMgL7YQS
	psBSFB80skxe5u8NrdFkT8OmYY+tbvZFk7rlmTQBDxbpU0WA0GQ9Z2fAWrrYLzz7
	kvBCKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5897wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 13:57:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so26108485a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232621; x=1794837421; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
        b=aIR/cUNah6ayW5DUHMLHb2tpxqS01XuYr2W9oxqggk0Tpj9HekxhDJQExlI9Q14cs7
         gpc8f0Nj4TWHRFoV/YU4hHJzSZJ4/aT/acEeLZTEyKnVYZ3fUb61crkKxnBLvbPNQXYC
         ttnUdXafBKLHKmqOgajLT7TiCv3pRELi7UGfLfG1A4VOH2abTzaROkEcfH11O101bwVn
         Dx/HNsyzMmajCoCyTU3yS1M8GNCVD++ngRuewpGw61zblG1/GEGzYpTRC6KNsw9LsRYG
         febtyCaQQebu8YHWFFNy31n0WVXwdWDhVnYM7Ge2cnRNMCJRjGtGRXuvJoVe9dG8giBU
         8+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232621; x=1794837421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahdWjaO9CBTxTVWPWfQbIkxMdhbvv1aJvET877LwySE=;
        b=VgawgL/oZwfYZyVDdhD8d6t/zIyO/IlnQQm64uX4rCORbVopwH1bAfaL2BwsdN7iIS
         9anYB2j+quTXBXwU3buDdKCNUvwNxMSMJIz5htE860nhubfNVWEzHEjART3DdnxaToA4
         9FDCbhPMNyd0Gu6vtnQR85Yki3kUHlMOJbR9G8xSzW1iq2V09FM3uGi6XsP5AySxrauk
         QakjpcWxXLGBIkC+1DF9+5XpxUczIjW/xwrWHz0sklaKQ3458MnbISoiGIZNwuClCVI8
         kJcagnxqEsnGWnmjGtxUodBYYZr6erqOmP8ogfbygVWgVWnG0Rc8zvv67ettCtNVYueu
         40eg==
X-Forwarded-Encrypted: i=1; AL+hErFkukLCoUcLOhcFowqD226sro5jmzVywyRbNiwSxcGtPnKTF3r+Sm+CSv24eeGvUK9BjH0kySzB6tmyY8LJ5A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9wZHQo58GBcZHBGX1oiGsnpbMffeqW+oPaI+RInr+IXF3NdBCL
	ZOj6xRQI3aY+0dDQmLThjqPaXnOzs5btqoWmE4PJS0c0EyrTAFbfkduOlhety6ngJ3GBVLlt9SB
	Y0tdzQlrG/ia8cL2G6EM1wqrT8SkOiDaHfDdkEbz27EHwx/ZZbz30mcRLr58ho3IvCecqJCpbqQ
	Q=
X-Gm-Gg: AYBFou3nofTHUXfIw4bPVJeJZ3ZF74ZM0MKGZKPNhGT7nN8lVwXp3fKwW/mrAdocw3g
	tpXGDwo/aJJwbqm/ZVvH6krYhiveXhJl6mDUJz0pMybwXIARJbbx5Pu7A/o//4eQ0c6qXo5UBkF
	HcyHJOucn/LPBWqHcLljHUe3rSSo2+lSuKKAAN/lafI8CY61LQA3gSiH6lk0c2yPhJT7UyKfmel
	iXV+yCbAcZWohYJ5g6qxTkHl7pC4iJLxwy9Irt6+Tqg4IPNMjDz7yE7AVI2azgCTK9ulxKzQVOz
	Chh6VHH5AWDdqDjMZMrh8e77hpTjxySc07ycrvvNhUJTOADvfJgJIJAZJxPdLv9y8tQN/pCMExO
	tp7E8E1mpSL8eNylTR5uJbw/o5HAbV3+GAo1R0lDGbmcq0Frqut4/7jLy2ZUGm/zcnYR5pA==
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr595077185a.6.1794232620990;
        Mon, 09 Nov 2026 05:57:00 -0800 (PST)
X-Received: by 2002:a05:620a:a897:10b0:945:dc04:c4b6 with SMTP id af79cd13be357-947842e6da9mr595073985a.6.1794232620528;
        Mon, 09 Nov 2026 05:57:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4aeccasm178463066b.56.2026.11.09.05.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:56:59 -0800 (PST)
Message-ID: <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:56:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
To: Sven Peter <sven@kernel.org>, Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
 <179407827117.165429.11777170722243752189.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179407827117.165429.11777170722243752189.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX1z0KjnwjqrFT
 d/mck9KkimHYf7b73rOKS+/Hnq5FsDt9PIVMf4pmJj8rDE2sbcgpiOMTxze5sBc5ntR2f9s3FM3
 G0GUwIuKIUl3JHx9ALhSjzwgH10gfsae/XeDblTkN2zYW9nVWRmG7dgliwaN4KUWUw6o9yEmPG3
 /fQ1vTPi+G0HDBw3svIYPkoaG4JwBEnbSuu+0OOfFyHpipRxYzXhzv/gIujgxLLjC1Xmy5LtJb2
 BqcfImpKmgG/QiWZ3Tqz00pNtg6pOW64ZW/YOfUZrckDtHrth3YGjEb1xau8zFTORKuXMDoXxrI
 ggwz9qUEbc7Wf5zP79ov4I00BjTgY3eFDPfPUm6jLs2+9LQ+mvdbY975pHZePvCDUo9ZmHcDT/Z
 /fWfC+DpmV/iCUxZkUBwfJyyBNwxzIkETy0EPMY5Wv6HizXsY/9knvTSKxLA6J2xm17Akr+qGnG
 REcfMsjubWBPFzf0yWA==
X-Proofpoint-ORIG-GUID: iGuvlPPB46c6WGz_CtcSRN8tXlZ16h1F
X-Proofpoint-GUID: iGuvlPPB46c6WGz_CtcSRN8tXlZ16h1F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXwMXYMY8050rA
 GbgIDzR76IJwoK4g4GhJAbwED0T+/W1zCY5Y/wh72OaKpZOk1fDUma/dZi0LeG6c43KD9PvABTS
 JabYOYxSXp50CgIuLV4mibkJHJE1vJ0=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1d12e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=mpaa-ttXAAAA:8 a=KjD6htFGCqKMDmwFDkwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_055703_638955_636C2541 
X-CRM114-Status: GOOD (  26.07  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 8:04 PM, Sven Peter wrote:
>> Add a new file plat.c to register platform NHI driver for MediaTek
>> mt8901/mt8992 SoCs.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>
> 
> [...]
> 
>> +
>> +static void nhi_plat_shutdown(struct platform_device *pdev)
>> +{
>> +	nhi_plat_do_remove(pdev, true);
>> +}
>> +
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id nhi_plat_of_match[] = {
>> +	{ .compatible = "thunderbolt-platform" },
> 
> Do you already have hardware that probes via device tree? You'll have to
> write bindings and get them reviewed before adding any compatible here.
> Generic ones like you used here aren't usually allowed.
> 
> If you don't have a dts based platform I'd probably drop this, not much of
> this code here is e.g. re-usable for Apple since they like to think very
> different, see my series in [1] that I can pick up again now that we
> made progress on how to represent connections between the NHI and the
> protocol adapters.
> 
> Not sure about qualcom since I haven't seen a series for the NHI yet but
> I'm sure Konrad can comment there. I kinda expect that it won't have
> much shared code either.

We're in the same boat regarding thinking different. This driver is
for implementations where the underlying hardware is abstracted away
(be it through architecture or intermediate firmware) and the TBT
layer writes are enough to e.g. power sequence the connected buses,
just like on Intel.

For the OF compatible, we definitely do need bindings and I too would
like to know if this is actually exercised - if not, we should cut it
out and trivially bring it back when/if the need comes around.

> Take a look at e.g. more recent drivers in drivers/usb/dwc3: They
> usually add a dwc3-$vendor.c file that takes care of all the
> vendor-specific quirks and that ends up being nicer than a single
> platform.c file with tons of quirks and separate code paths for each and
> every vendor.

Yeah, this is a nice parallel. Adding to it, there not only exist
dwc3-$vendor drivers that take care of the additional registers and
whatnot, but also everything around the USB subsystem - PHYs, perhaps
some NoC drivers, and all the infra that feeds into there, and it
compounds back into the size of some of those dwc3 glue drivers..


That being said, the makers of the spec probably wanted/expected the
hardware to have exactly this neat level of abstraction and I
wouldn't be surprised if more designs end up being compatible. Or if
the platform firmware makes it appear so.

Konrad

