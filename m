Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7125CC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 04:07:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405F52070B
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 04:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYDxbjc8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 405F52070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dxCiCz02tlx9/HnlPukIEELz6EHrQ18a6Wr6Oo9AS7c=; b=jYDxbjc8fNNYa19tr6vU7ML7b
	gw+ObMfN95MdCaIpgoT7DVnBZoGwD1kzKOkCNXh70FodtJWinqse42Gd/PDc4p18oG25+RfU1jdPg
	CuO9TCbefEMmyIXl4r4W9E8R419OE0IaNwbpQzBqcjsa8O9TEV3/ljP4FNvMTDHz3XWJiEoHjrB3C
	1cxgq8Q1SS1nDf5YdN81k8VRIeP41odPJ16OFb9mAJ7E92VSLSfSrRc2mSB4kFUGbI13id9zEsW/T
	J2X39rLIW/lK7KaSYV0xhugNXL+A4wye3JKDIM84dENm/dEYJMKCe6Z7TLxh4lXO/OTysBCW9MAxl
	qxeLITYdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1MJo-0001FD-68; Fri, 31 Jul 2020 04:06:52 +0000
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1MJj-0001Db-Ms; Fri, 31 Jul 2020 04:06:48 +0000
Received: by mail-pj1-f65.google.com with SMTP id e22so6560129pjt.3;
 Thu, 30 Jul 2020 21:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QQ35CE9yJFKcx/uvB2EsoL6aQNmrJJ39h4x1UksSOeI=;
 b=Nzcnqup9Bj1zAUUjGRCIu1eKbug6g0WQb+wN2um98ZBY905Qm0T9SsD03eva4pmQjc
 whyJWIpS+6G0PX8x+gpiW04ZwshgJOREeHQWvZ4AaQ6gs+7cf5XmpJFIoOxsTMtUbv+t
 zUQqyPQljPzp/vNgsL70EkBj6cRESYY0D4xA0O8WtmWVzp9u+gxsXD8tpCOUObMFfFal
 SPqBmMdqy+xOENhs3FPyAFP3/LO/c24LBzL2i31hH8SG5W5lCIXdTb2K4Z350rJq2VF9
 0DKb7wAid3YFBGqQXKAh6IxqNVxzdskpfEunZiZjkDCdrYk568NJpBNwQsY3dwOlqozf
 X6nQ==
X-Gm-Message-State: AOAM5339iwDrYcue1SG64o7Qc6ogC0VsMQ8dl0DOevzOl7Z37YV1hF4k
 xrGEUHlLv6ORRzySwcrNNGo=
X-Google-Smtp-Source: ABdhPJzXnGsmXXgO8qRrgHFnZCn5E/++s0JbD0mUM5v850qtfGXGD2zI4A5vvBBtJhqa9flYfth/vQ==
X-Received: by 2002:a17:902:ff13:: with SMTP id
 f19mr2147996plj.326.1596168404804; 
 Thu, 30 Jul 2020 21:06:44 -0700 (PDT)
Received: from [192.168.50.147] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id r8sm8054046pfg.147.2020.07.30.21.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 21:06:43 -0700 (PDT)
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
To: Stanley Chu <stanley.chu@mediatek.com>, Avri Altman <Avri.Altman@wdc.com>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1596159018.17247.53.camel@mtkswgap22>
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
Message-ID: <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
Date: Thu, 30 Jul 2020 21:06:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596159018.17247.53.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_000647_760508_F4A631FD 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-07-30 18:30, Stanley Chu wrote:
> On Mon, 2020-07-27 at 11:18 +0000, Avri Altman wrote:
>> Looks good to me.
>> But better wait and see if Bart have any further reservations.
> 
> Would you have any further suggestions?

Today is the first time that I took a look at ufshcd_abort(). The
approach of that function looks wrong to me. This is how I think that a
SCSI LLD abort handler should work:
(1) Serialize against the completion path
(__ufshcd_transfer_req_compl()) such that it cannot happen that the
abort handler and the regular completion path both call
cmd->scsi_done(cmd) at the same time. I'm not sure whether an existing
synchronization object can be used for this purpose or whether a new
synchronization object has to be introduced to serialize scsi_done()
calls from __ufshcd_transfer_req_compl() and ufshcd_abort().
(2) While holding that synchronization object, check whether the SCSI
command is still outstanding. If so, submit a SCSI abort TMR to the device.
(3) If the command has been aborted, call scsi_done() and return
SUCCESS. If aborting failed and the command is still in progress, return
FAILED.

An example is available in srp_abort() in
drivers/infiniband/ulp/srp/ib_srp.c.

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
