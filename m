Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668F606A338
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 20:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=km+jBilz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwFxCH7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gslv9StG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=; b=km+jBilzNlt4mj
	iWd6Qg/zODYS1bDS3qtNnkTu1kDjV8+pdCqwtSQasaoMO/7bgiMCot+tQsbbwPBtmq9aappZts47J
	tZP8SQVmPSDG2bGyU5PczrWWk5QZC45LxWNnhL3nrYvn71NmVkUexeGuZMvxId4ERg7dEIxd/RzFY
	29vnxoF7EJ6Unk1C1+2Xnw8KmhJY8qf6U9BvsOauZbtiq++pAOBRro6xvZ4qalhKEsBZIC4vwDQtk
	8e1m6vpXkBRevanhZLEoYpdnkuPxtC72wIVOZPNR3TXKp5Nk2lE6XGE38yEf/NTMQtor/TQgxn+ZQ
	TqTkTn9ucBLzX4FFQmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyW5-00000000IRY-0IzK;
	Mon, 02 Nov 2026 20:20:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyW1-00000000IQC-3TXw
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 20:20:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5ux43955570
	for <linux-mediatek@lists.infradead.org>; Mon, 2 Nov 2026 20:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=; b=UwFxCH7dmNX43b7C
	Eao5uTE2EudGxgy8mshrWaf5p8bP9WiZg+Yrb2pnPRfW0ViC8O9dfn7rzwtm//Em
	2LYnz/Li27+yEceOczlZkDQTFb+i2xPnBU0SPsiqsvUTgm92tQYJP7on5Qeoe+qu
	bCAB6JoR0d2B5IW51NFJmJOuz1GbKbYP3+OWop12ApvAb3/eqBPQ7NxERERYrwqz
	rWWmM5iKRcnWImpBDFj+I6PIVSSSvMajTPrVtGPq0Val7ztS5l5OWrf+/8OVDHjH
	20t89mgGFucjHZrmZy74QTyHTdqKnTnEv8WJll5JClTL1zNPtcC3m92f+XlGjYPh
	Yax9Wg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081rb9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 20:20:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1acbaf81bebso4228933c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 12:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793650825; x=1794255625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=;
        b=gslv9StGsnO/cWHNsTkJ5c1wNM/+S/eEyPQigO0A9Zs/u6XZ2LTXFcaiTKkniRpH+F
         r8HuT+dZ+jGB8yj6tUtYKzDBSpmIOJJfc+bVxo9qMdZPu2+9AIVWjaoaJczL9VrLQMUT
         BT+Be+wJCUOwJN9NNvIn9VOiorrTW8zIT0Ugz/mrBduN1DhPtrF/Hx+jizv/pmVoKLWj
         00zGTPXa6nIe4mq1AyqOD6saIzKvLeASGpeybMtRH5ta4XupNTMMZFb1gJNP+/NrDxt8
         vCDhCBw4Wj/U9DQBXAcEWat8U6ZZc2FzpJf4PHs2pdVCc8lKW2dCL1cQKT69LdBJOdMl
         irlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650825; x=1794255625;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iucO72ygHraKKoulvOM5elo/8xXNl6l7Hm5EVeQw/hM=;
        b=pHpdr7DbNxxoZqT7OtTVwEyJAm8dD8ZVdqNLQoHC/OBvYUzl1db5N7gbzDonVJss2u
         t1TqOA6kj43atWk8awm/QKjzlR6avCBpVy0AST8ODaUOpVO4tqb4tEdb49fFx5lQH8tn
         hH5lITWzJtulLCfpi+cMs5R+CYlWVNjW6Aq9jeuyeLFLjcC8zGx6JCX3+UFhwWbxtW9z
         4Lfuxs8pMpPrcFmWsN5bmrsdiPfNmErhHefBHofFAgY47/+HKj63YCd+g8LtDqYSsaRS
         IiyUsbwLWmgiArOQ2teS8fpedqVXo8IPOWM6uQyVogWU1vnT0EPsKCqdXOtB3ff+b4G+
         /Hpg==
X-Forwarded-Encrypted: i=1; AKwUvByFigOOk96iCnxQxcOrjG+HAN/tP92BdA2zP6Fzfs4yuP3j6BzRzXVo7dzr2NulCYFUHus0SQpkEdz4kqEG9Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLCC6T/O6VeBGwggAwFrLJ5TPC3RmdSOSwdJPhXTFpXJHezlAeG
	nyMgl90V2rXBk/fWZhcsDPgpxiLaM4/LhpGs58TQSyf3B2Ic2I2mXGGE/3xnz7QMBiGgQNHCU/r
	qgsgFFw2OUygZsto/9nknpUTC1ftDSURj1he4vmejhLNTXCHfDOVJH8V77QGkdUei6BBootOdNX
	o=
X-Gm-Gg: AYBFou3fj6A7U0jJnk2dU42CsliPZPtE4vXKVN0YKvOo88RF1lXiDbjg+iM7DA56+t9
	3HyZ1ARQ2OEs/71M+evA77dEA/YyGfyZE2EP3xMgLXQvXdR+DIqAYW7zGSnUydVx5EIgrMGsPCb
	6rVqEFFXnHNxwUK8gzYnJEZ0ES9jy96D2RIjBbCMqWNdBOQf1eh8FY6rSq028+7ZFN03KFRYGIE
	oOZf16DOBjJO68q6IyHW6ZZsK14LoK67F0Tc4V4dfQnR6hGtAyW5kKZtgzD07I4jjyNEwGIdOSk
	l1PaN0RCYr298B4gXGdNsWGdsn1q1EOwqoVPwEXIh5mJfODwoOxQYhK9eKMM6X2XT4K+iL4qP8x
	o49RrtJIKQ01J4+34DC4XvXNnq9j46O+3BuFJpp1HW6hu9c2WQ98848KpusKQvbmFBFxPCnJbdr
	0BRBsteaVmsUaIFse5vTFGQuahm1E=
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr20350132c88.19.1793650824366;
        Mon, 02 Nov 2026 12:20:24 -0800 (PST)
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr20350072c88.19.1793650823637;
        Mon, 02 Nov 2026 12:20:23 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm36146267c88.2.2026.11.02.12.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:20:23 -0800 (PST)
Date: Mon, 2 Nov 2026 12:20:19 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "santino.wang" <santino.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
        <arnab.layek@mediatek.com>
Subject: Re: [RFC PATCH 09/11] soc: mediatek: dram-ecc: add a generic
 netlink event interface
Message-ID: <20261102122019.000021ad@oss.qualcomm.com>
In-Reply-To: <20261102092334.138759-10-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102092334.138759-10-santino.wang@mediatek.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MSBTYWx0ZWRfX+MR8G65zl0UK
 jJZNM7jBinumqKh0xvK2+ih8zysYcPQehEXtz94kmSmJttv6Phss2Im4l8asRN0WVWsuOEIZJJW
 XCjvNM/1IXrxM7HjwEsj6GGRnVOQ4BQ=
X-Proofpoint-ORIG-GUID: uzSDy79TA1VPm98C3ZCSzPdjS6bsQFtd
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae8f089 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=mpaa-ttXAAAA:8 a=9CeU9Xj6n_7RUCDYDCEA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: uzSDy79TA1VPm98C3ZCSzPdjS6bsQFtd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MSBTYWx0ZWRfX5HuB/02pQDkz
 2w/3lTyJTNRz3rMo67A9i8T7z68WvdgF7oqY1BRCNfwkR2PO1zH6gqpGd5WtzXgeawVlRyixUSY
 8ors1mpSQDIV8p9N2eEMAOrp0rnS91ilJuK9qRNZ3dOWJRulCthZsMHk4ZN/nhwQJouYMB8RDiA
 Ni1XhTQ3yahWqrNnfiN/eRjk9ysKNGyUnLBI/YU1xqEQLwDTO9pyLUyDspNaatMPa86fU1UEzmn
 Sljj4+e2sMDl5/MpijsFirI0FrOMJRDdpqRC/YL2NUO1NpCX83IkZbdM4e/W9vzPcGcUBJdfdOm
 8HvgseHWNBqq5GZZ/yJfdn4Z1Mh90dBNTi0nTnFrQakG0kG9RTOyVFwSOUXXFEzObtUvJw0Dg8Z
 0mmysOHBSuiiM0HQ2ja7ZAVgMJiD+mPL18ixPFTXWiz0n09JGKQoGwRFGeXi2PkgeGsAPBTBg7F
 /A45L7T3cu3FLxMJCJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_122025_876662_89824C8F 
X-CRM114-Status: GOOD (  12.59  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 17:23:31 +0800
santino.wang <santino.wang@mediatek.com> wrote:

> From: Santino Wang <santino.wang@mediatek.com>
> 
> Multicast every decoded corrected and uncorrectable error to user
> space through a generic netlink family, so a monitoring daemon can
> subscribe to events instead of polling the counters.
> 
> Signed-off-by: Santino Wang <santino.wang@mediatek.com>
There is a long history of using tracepoints for this. Why netlink?

This patch needs a lot more background information.

Jonathan

