Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1816CAC5AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1xrpqBgU5VRolmF7QTk3y42QIWpKPlrjBX+KzL4FgQ=; b=uXDYQgWveFL2xbFbx2G8vjvo0t
	MUqvyA5KXXDHdQRSJ8URCSt4OcDaHzQjQL2Uc/SRxNlTJs5ZiLCDxtW2tZtm+1jkbWtLs8JUgPEx6
	tI2Uk8fQUBf9BBmBDWReUcYtRv3z33q/eQzvabpl36NNwOYcUYAhvs/kjRPGm66un7uVxw/a79txJ
	iej7+v0Hv/cKkgyI9mp1nlIjpSp2aKV30TyKiMECGRjBc+GhvKsabicxovXZELi0rvPmNjVBPgEnH
	Gi10KUD72/oCyzyoECzUPq1KqQmTK5d7Ot905Q40/JYgfIbHA9n6q3fNwK5buw0ibSAvDcdeAQdex
	nB/rHWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1A5w-0000000EpH1-17cr;
	Tue, 23 Sep 2025 20:58:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1A5u-0000000EpGv-3IrF
	for linux-mediatek@bombadil.infradead.org;
	Tue, 23 Sep 2025 20:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R1xrpqBgU5VRolmF7QTk3y42QIWpKPlrjBX+KzL4FgQ=; b=pnh+tHKN0NzfO4UwjM5gxcg0zJ
	hbB9USUryX6IjO0mHMB2RcPCljrh+tDWYM5I8E8OOl3DHCHaKwlt/3luBbGbLL1hby+X4h377L+DJ
	TUQzLelbdbjX0qRt4WZjs1csZq9dMbNSPLcLIEkRfLbFv841sUuCxOPH3Su49lPgvXZdYuPBzo8fw
	2yjSmGEQphFKNbaNwzMc1NfmOoW7iOSSgJQWnsxgKxxIYKr1J6o5I/5Y23dMZudCKtALqwyJmQwOD
	PKDVbcgG1kTS7OGH+/xE6gbogv71PXOb8DyfH1kttea4rmUJ6lQkrzPqM2zCe1oicW6jqxHlYCisu
	7EPZ6hkA==;
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1A5X-00000008b8w-3qVN
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 20:58:30 +0000
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id 15Qzv8kJjSkcf1A3pvDWmH; Tue, 23 Sep 2025 20:56:29 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 1A3mv3aOEfhew1A3mvupo9; Tue, 23 Sep 2025 20:56:26 +0000
X-Authority-Analysis: v=2.4 cv=Q+TS452a c=1 sm=1 tr=0 ts=68d3097a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=N332or4wHRcdzxpigiEmqg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=b_psskLWchTY9WQLhBIA:9 a=QEXdDO2ut3YA:10 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R1xrpqBgU5VRolmF7QTk3y42QIWpKPlrjBX+KzL4FgQ=; b=UWgMXUTL32B3ppGQ/KieJsvITO
	iVwEyvAE/fLiFemHW/d712vtKD/8quLIAqr8Ra04bZa80zyszwCpxABXejd3p2yp9m0GYxjBAJhLW
	R+qZUeb4f7TU4uoAOzA3Z5bI/gwAAEg0B/Ttizir+kOEeBOJ+9yk1Lk1m0ylwUkXM+i7GIMVWJ+GH
	4PE5qXTs2yjETMpNecS5LXOqCUnO4BZ5m0iJV2cOLRyeYmVyD3fFZjM/aPe6nT4qz0gVof7WQNW7o
	kfW5HrPuleM/rjx15pKSguLzsQ/AsB1L3nnQWfR0dh7je8ojf6cGloMUttQvhRFUJobmCsYNhprcn
	ep4BtMCA==;
Received: from [83.214.155.155] (port=52914 helo=[192.168.1.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1v1A3k-00000003RJX-4Bcv;
	Tue, 23 Sep 2025 15:56:25 -0500
Message-ID: <e1c9e3e5-b04f-40d0-b05b-c119cf2d3cb3@embeddedor.com>
Date: Tue, 23 Sep 2025 22:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] net: airoha: Avoid -Wflex-array-member-not-at-end
 warning
To: Simon Horman <horms@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <aNFYVYLXQDqm4yxb@kspp> <20250923185525.GL836419@horms.kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20250923185525.GL836419@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 83.214.155.155
X-Source-L: No
X-Exim-ID: 1v1A3k-00000003RJX-4Bcv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.104]) [83.214.155.155]:52914
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO1OpKpbIpO0Y6iagfR3Cg6wdbpaVxYOx+KNRx2j5JrD5zIvWPneu9+yNGUGszp65QDu0AYPuMcv+fV4QrCbf0s3kAQmBbanyX09hzVH5ras2H/g6N8B
 QBxuRTPJVxrJ3/F9l4kOa7GXEg44cM+ZqcHJeN6RY6oOs3Z3klCcSjP21+T867JK4aGRLM8qW+GtgcgFnnL8O26bZWX6Kro8LYDSqdigmC0Khlkuv/KIGFyG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_215825_398186_45FB94A9 
X-CRM114-Status: UNSURE (   9.97  )
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



On 9/23/25 20:55, Simon Horman wrote:
> On Mon, Sep 22, 2025 at 04:08:21PM +0200, Gustavo A. R. Silva wrote:
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> Move the conflicting declaration to the end of the corresponding
>> structure. Notice that `struct airoha_foe_entry` is a flexible
>> structure, this is a structure that contains a flexible-array
>> member.
>>
>> Fix the following warning:
>>
>> drivers/net/ethernet/airoha/airoha_eth.h:474:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> FWIIW, I was able to reproduce this locally.
> And it goes away with this patch applied.
> 
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   drivers/net/ethernet/airoha/airoha_eth.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Simon Horman <horms@kernel.org>

Thank you!

-Gustavo



