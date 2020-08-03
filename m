Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9D0C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 03:12:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5160A20738
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 03:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bjCplc0e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5160A20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/30GtvNg0ZlCMOK6k6ERj8cSNUM1rZeShTw3he7fSoI=; b=bjCplc0eEE0hNhPKebmBhqGjM
	nnn9zIi+9dq4qsz2l0OtfbyPKsqO1v4UjuDLgALImcjQM+QTlMAB/2kCkMtQSCCbTznein+2AT7ss
	EhJDRewVmznR/ar4Wjr/lxaYrZixyO6oorM9rU2mqIOzgU2zS3YLHL+IMmzy4GgzfCWN5c/ixVlx/
	Bl8Vf5k/zoj16UtKN1p4XuOXyXgcH3WPJOEmDAsDloUwa2MiMeFUxPrYu36FtgQ1aDzANQHJ+2xgS
	xgg1q1QwFe0W4Ec3RSPgrL8GgQy7t7xdISGjomO4e9ldc6aLXOBlBirmrG1CBXkdzn3BqMgC5KhdS
	x8yTXUAow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2QtY-0002vR-DV; Mon, 03 Aug 2020 03:12:12 +0000
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2QtV-0002uZ-5z; Mon, 03 Aug 2020 03:12:10 +0000
Received: by mail-pl1-f196.google.com with SMTP id b9so20028415plx.6;
 Sun, 02 Aug 2020 20:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nf3xdvRmh1qxPw9xaehxZVxmJAEdSCtmDvi8x8RGLZA=;
 b=f6v0tyL9gl/VCNfMqNuOXLhqeiV1Q0ojkyhszYjVO4RVJpGI7IyATYJphjNeKlxZa+
 ZAr9PcgNyMabugxTPM0XSQ/bz/aIFn3J4vunoj3tzagsP/tESEwXpmEkTztAWz9NjQl3
 dAOMgjxNkOGKcSdHQ5XOsMuCJQbXlzh+16R06YtAvdu+Bwp5VVJa8q1ZcLLpqzeecV3O
 zHNj1HkHnPMF5E+ys+6UYiicy8NLaRMDHLmGm5q1WFVgci8IqdzT7uYCInCaYRAgAnPP
 phsbHlr5ahfA4F3jqSfmH1NkKcYi0xwZ+GuK3HDpTqrZ6X+jLOsOxFkddKixmGoUOCtk
 XxYw==
X-Gm-Message-State: AOAM531r4+yZNZrdapHTrDlQ2wAbVin88aVPo/wGp7i6/I/C/HdfQNb1
 xLqxuq6iPDXDL0DHgmJGcW4=
X-Google-Smtp-Source: ABdhPJywN7xeGc+45Wflkb5T3yOEfJSEcVl2zr7qKaDme2kp5gFS9wAygKUggiTM15WxJAV+n+gG8g==
X-Received: by 2002:a17:902:6bc2:: with SMTP id
 m2mr12379497plt.119.1596424325859; 
 Sun, 02 Aug 2020 20:12:05 -0700 (PDT)
Received: from [192.168.3.219] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id y10sm15060677pjv.55.2020.08.02.20.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2020 20:12:04 -0700 (PDT)
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
To: Can Guo <cang@codeaurora.org>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1596159018.17247.53.camel@mtkswgap22>
 <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
 <8b0a158a7c3ee2165e09290996521ffc@codeaurora.org>
 <f45c6c47-ffc5-3f8e-3234-9e5989dbf996@acm.org>
 <548b602daa1e15415625cb8d1f81a208@codeaurora.org>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <80f5e213-502b-3532-e782-6f26a778274e@acm.org>
Date: Sun, 2 Aug 2020 20:12:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <548b602daa1e15415625cb8d1f81a208@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_231209_277899_02C0FA38 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, Avri Altman <Avri.Altman@wdc.com>,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-07-31 16:17, Can Guo wrote:
> For scsi_dma_unmap() part, that is true - we should make it serialized with
> any other completion paths. I've found it during my fault injection test, so
> I've made a patch to fix it, but it only comes in my next error recovery
> enhancement patch series. Please check the attachment.

Hi Can,

It is not clear to me how that patch serializes scsi_dma_unmap() against
other completion paths? Doesn't the regular completion path call
__ufshcd_transfer_req_compl() without holding the host lock?

Thanks,

Bart.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
