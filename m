Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1532BC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:37:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD5660FA0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBD5660FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PGQKq27UopXWLQ0Ns+R4H6xmQqs+b5cBmN/hJOq/khg=; b=gg2BOynB+0Lu40UFXCBiTh1vJe
	gJzV+e3SjtL/69ny+15gKQ9+cruKXiko+whu5yj9Hlzcd7qoDt2hTQgopTyLFl46Emde8bfXH1qS2
	j179q5XBRV2I3ZBzjQWqYo3NsnJv9iZyEa/gyaqswD9G/yFsclqEQWf1Dq/P1JSGHCkU38kfNoCWp
	9g5W3A+L8W0XK4kAROh9UpoiBrQFbRCyFwQAW115qAWTSPw6YPYrsauJ3qmR3nd9YPLJzYg9gNoHL
	uaSo/ac4nj8kKU1kzm4qTBgK/SL+x3sploz1t8CTNMr2o/1wVDt7oj3WWT2lmURa9TdeSv/FmtYhz
	hc5tt4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY84-00GQ7N-0I; Mon, 02 Aug 2021 13:37:16 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY80-00GQ58-Jb; Mon, 02 Aug 2021 13:37:14 +0000
Received: by mail-oi1-x235.google.com with SMTP id u25so24086568oiv.5;
 Mon, 02 Aug 2021 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PbcBzYCDzjM/TKXUy4gd/mf09bcYCldaAFLfvfQnHzQ=;
 b=DwaAWEc4Q6Uca77i1pa2FzsHjwr9/FjCJvqewvhgiKAby+uKugn8R/1vtl381tQ9TD
 zD6mjWM7EDPmBy87dl6240otKOcRKK1tPlXJY1ZXkmxjjFZBhIk06BhMdPmByoKvaPqg
 Y3mtrBAYzvH3br9rxFH3OmFeiQ//k8GQ/IFamrv3tamOfxhY+RJQzGqYHx+AToApOs17
 mwY54HJmk5kv5ObixIBouxDiRRWFFhhXyumRy56FpmsZ18OAF6ob0pvtdJsHllSVets1
 NRS7JS7nUCA04dXRUjgz0WM4Mcm0r3xQY8IQnLSI9OoH+2FoLlk6ZZDuNurkvBpCGMUJ
 l9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PbcBzYCDzjM/TKXUy4gd/mf09bcYCldaAFLfvfQnHzQ=;
 b=bxA83JTkdichQTnVCUtKfirKCOrNyMGmNivGN9csceujd9Vb+Lx7VLVLunsrpFjcxa
 BiR8EqLdArksOAcA3jNwjJWZiF8ccYpfRvXiiT/bXC3gQJT9RQs5wjpSntOb9Sbqi4fI
 BVXg8V3T/wjBXI13hyaIIk4SIzIQoSZTiNsQAJ+s83g+Te83nLib8llGK5Snlyq+JKEA
 7is7udd5zmOXlJ+Orx9aeR8N5L4e0U8L6HeKfrB9Nau7ak/ga/IgAxuaWhCG6dKM5Fri
 PK7VoTV5h6ftBkVH8/LTWEKxYprVnPAWgzUhtWkQjVfVr0cRFK3EjbB9fU7MdW6/yyXL
 jNaQ==
X-Gm-Message-State: AOAM530gxxgXW9whhx85njrY+atq2Pyi+SNgkCQhS2ynn4MtRNKh6J/o
 XXk7+ImM0zuzWzT+s/cGBT4=
X-Google-Smtp-Source: ABdhPJyf6PwIBiYKEvn/j5AUOIaUsrJFqOISQa5mzqZHiymrzID1xoPdYD1lL+ot9DwqGtiWx7VCEQ==
X-Received: by 2002:a05:6808:13c5:: with SMTP id
 d5mr10367796oiw.56.1627911431838; 
 Mon, 02 Aug 2021 06:37:11 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.27])
 by smtp.googlemail.com with ESMTPSA id r5sm1856639oti.5.2021.08.02.06.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:37:11 -0700 (PDT)
Subject: Re: [PATCH net-next v2] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>, David Ahern <dsahern@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <5be90cf4-f603-c2f2-fd7e-3886854457ba@gmail.com>
 <20210802031924.3256-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <f66750af-cbda-6d49-2b39-860c10357e95@gmail.com>
Date: Mon, 2 Aug 2021 07:37:08 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802031924.3256-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063712_721254_D942C942 
X-CRM114-Status: GOOD (  23.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/1/21 9:19 PM, Rocco Yue wrote:
> On Sat, 2021-07-31 at 11:17 -0600, David Ahern wrote:
> On 7/30/21 7:52 PM, Rocco Yue wrote:
>>> In this way, if the MTU values that the device receives from
>>> the network in the PCO IPv4 and the RA IPv6 procedures are
>>> different, the user space process can read ra_mtu to get
>>> the mtu value carried in the RA message without worrying
>>> about the issue of ipv4 being stuck due to the late arrival
>>> of RA message. After comparing the value of ra_mtu and ipv4
>>> mtu, then the device can use the lower MTU value for both
>>> IPv4 and IPv6.
>>
>> you are storing the value and sending to userspace but never using it
>> when sending a message. What's the pointing of processing the MTU in the
>> RA if you are not going to use it to control message size?
> 
> Hi David,
> 
> In the requirement of mobile operator at&t in 2021:
> AT&T <CDR-CDS-116> Prioritize Lower MTU value:
> If the MTU values that the device receives from the network in the PCO
> IPv4 <CDR-CDS-110> and the RA IPv6 <CDR-CDS-112> procedures are different,
> then the device shall use the lower MTU value for both IPv4 and IPv6.
> 
> And in the 3GPP 23.060:
> The PDP PDUs shall be routed and transferred between the MS and the GGSN
> or P-GW as N-PDUs. In order to avoid IP layer fragmentation between the
> MS and the GGSN or P-GW, the link MTU size in the MS should be set to the
> value provided by the network as a part of the IP configuration. This
> applies to both IPv6 and IPv4.
> 
> That means user needs to be able to correctly read the mtu value carried
> in the RA message so that user can correctly compare PCO ipv4 mtu and
> RA ipv6 mtu.
> 

Then userspace should get a link notification when ra_mtu is set so it
does not have to poll.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
