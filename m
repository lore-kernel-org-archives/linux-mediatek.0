Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D208C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 20:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQTVmiGy4XA8SJdBOXa49cK5LJCm8IUJP4Jl86RWpeM=; b=itHzLvH0nxeNtlrz6mt2Kng9d4
	CL7DgG6pqhhUfzBQRI40enip1exFzaLiTSY5LasXOCPqI5V3iD1kGNlRHPKyBVG6gN6KrZmqRMQ49
	u7Q79TyNVLJLIwM90glH8Nv8PlFK0CMnMKFsACidF166dg3yRnfhpcauOvDb4tAVusLzq/HV6iV5b
	1OMglX4s2kVjXrUjusiHJ1Pz1aIncTW4+GGJXXOkhZoLyGg4lvTwT5s/z5rl3J8K0ZDM30TA5tBXw
	6ziprZT0gkU/5IB10GLovvOgxmBLnE+NabgLUovds1Rm2TtJucJ/hpAUVAuuB5wIvIMdQ7rR3jTiY
	3+Arq4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMsO-00BTnV-58; Fri, 30 Sep 2022 20:44:52 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeMs3-00BTcM-Dh; Fri, 30 Sep 2022 20:44:32 +0000
Received: by mail-pj1-f46.google.com with SMTP id 8-20020a17090a0b8800b00205d8564b11so5231990pjr.5;
        Fri, 30 Sep 2022 13:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lQTVmiGy4XA8SJdBOXa49cK5LJCm8IUJP4Jl86RWpeM=;
        b=od+5R1IhPBRMJfxotysTwq/nkkidgoaC46WrC9jl7ujoFbNc+mFY2FEaLvrZw8wUit
         3wzhHnOsK/jS8khsZ5D5n9tB5/PCvCkag+NV2Mf0BTBxBU3SDYdFx2lQEYy9PuiCSJ2W
         uKcvc7lmx4FD36HCxEZYQpOguwI0gPDt2LYOxuEigyQ0UMWxpGXGw34Gulkb+ybMWgtx
         Q1WXC13J1dpHUY6Vc0l76wCxv2P1Zd9RYc+1FCVjsRnZFbKRVR6hs9pYch0CpDoagjsK
         oiQKtQXz7ygGeP0J0CtIFDdvatAt0yafAyIC+hyRVY54AwLYJaWFr+TChBILAfSB/HmB
         WqyQ==
X-Gm-Message-State: ACrzQf3HzVlKODWQSX3XPHJGx+rKGOeITygsTMiP25kw+7d5JqZktr4q
	LRjRPpOm/6f8e6zl5f4xrqt1cVz8Ibyd1w==
X-Google-Smtp-Source: AMsMyM4vtqJtuvFGN5HE9nwADzNivEWqLh9pin2dDmGeUeJD2XG8e1LlvHmbGKYSLhb+l4O+73jTwQ==
X-Received: by 2002:a17:902:c9cc:b0:17a:a81:2a8c with SMTP id q12-20020a170902c9cc00b0017a0a812a8cmr10643885pld.6.1664570669633;
        Fri, 30 Sep 2022 13:44:29 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9b89:d9c:f74c:7711? ([2620:15c:211:201:9b89:d9c:f74c:7711])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a195e00b001ef8ab65052sm2062433pjh.11.2022.09.30.13.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 13:44:28 -0700 (PDT)
Message-ID: <1b0169cf-8158-557b-c544-f1b6df2143c4@acm.org>
Date: Fri, 30 Sep 2022 13:44:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 00/16] Add Multi Circular Queue Support
Content-Language: en-US
To: Asutosh Das <quic_asutoshd@quicinc.com>, mani@kernel.org,
 quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
 quic_richardp@quicinc.com, stanley.chu@mediatek.com,
 adrian.hunter@intel.com, avri.altman@wdc.com, beanhuo@micron.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <cover.1663894792.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_134431_499453_4D134BA4 
X-CRM114-Status: UNSURE (   8.00  )
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

On 9/22/22 18:05, Asutosh Das wrote:
> Please take a look and let us know your thoughts.

Except for the comments I added this series looks good to me.

Thanks,

Bart.

