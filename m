Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293E5C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:47:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AFFB2072A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J7DlunmW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AFFB2072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/V7FglxG91vAxdAcPwSwCHxCa6anR716Ggl2j65x/Jg=; b=J7DlunmWEUOFWs5cOc/+hf+tx
	8vsILwAXWm8G2G9yAlUFe5jZfhKiXhNDMSKiy52recXMBQ2UURdmLmwhqEoeYV/Wuo8mLoGYcubmc
	Bg1qtB86UCieHNRzlbrT2a788YYhzsaIODCR00iLsetPiSugqDeib+lKeRZUybo6FW6BsVcXhSG06
	r5uZOH/FCONhreby0/kk4QdKRoJQOsxVyvvzCPv2v2XhlA8fMNfL5Hj+aZe6dHFCz4uTaP8Sp8t+l
	gmuFLOkfaCDU6EOKkoJabnV4hQS9KwMvu5g6i/9N1QMObrhCwKto6cCiVH+G4pgi9nyibPbiuvEue
	SjsGrcuYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2nun-0008LF-V6; Tue, 04 Aug 2020 03:47:01 +0000
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nuj-0008Jk-Qy; Tue, 04 Aug 2020 03:46:58 +0000
Received: by mail-pj1-f67.google.com with SMTP id ep8so1264587pjb.3;
 Mon, 03 Aug 2020 20:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vBPRxVAtiIh+hMd6MgoRTAujt7UnJ3iyofuxdlQmALo=;
 b=GYqO25rrb+1Ml2V6lusRo4adJCOSWi4U1/Pf3pc0JKvJu4UJp4AWksSmvFHHd83plM
 ewO5suoF/1gUS/377u/KtInQsFzwkXAwRmMC6grOT8EGDhNT5/U8j5gUaqowuJbtgWV6
 yXm9e293RL6CN9pMKKjeyaTDP3dDvUNUnuaK8YX376YsiSupXg/QVEILth4PGDWLmHE9
 eqUz8RFs08xzyTmpA9N9GVkAJ13OipQVIEx058xebiF8RZMZE3l4i8QXAKYRgS5lVctB
 C+qymGOHuIKH29rbc5SRe5MlcNVik35yh9ZxIp1xXjPKaEJs5lMRaaJDfH09x/p9/FYh
 Bg9g==
X-Gm-Message-State: AOAM532X9C0oiaTWJrk+OvBFbM418BfP0qMnulAKUmzsW/LHpgbiJUFw
 VPUkHHMIE06qATkUm0YhHXo=
X-Google-Smtp-Source: ABdhPJx/+gECl1TJizV6HiQlhIuC0hIHjXX4gyL5N3hMRf7Guyy8HbKHKClaRP74gg39lmcvnl+YFQ==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr2333228pjb.182.1596512814790; 
 Mon, 03 Aug 2020 20:46:54 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id y10sm6987848pff.177.2020.08.03.20.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 20:46:53 -0700 (PDT)
Subject: Re: [SPAM]Re: [PATCH v7] scsi: ufs: Quiesce all scsi devices before
 shutdown
To: Chaotian Jing <chaotian.jing@mediatek.com>
References: <20200803100448.2738-1-stanley.chu@mediatek.com>
 <f40ad9e1-2e45-f21c-d067-eff579982cc7@acm.org>
 <1596511150.22157.12.camel@mhfsdcap03>
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
Message-ID: <4cf54989-d04c-0839-160a-508b3c29f32a@acm.org>
Date: Mon, 3 Aug 2020 20:46:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596511150.22157.12.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_234657_916255_1D86EB52 
X-CRM114-Status: GOOD (  19.89  )
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
Cc: beanhuo@micron.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, jiajie.hao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-03 20:19, Chaotian Jing wrote:
> I have a question about this:
> thread A is running the shutdown flow, but thread B is still access
> UFS(sda/sdb/sdc..), is it expected ? after the sd_shutdown() completed,
> if thread B still has access to UFS(sda/sdb/sdc...), it will make the
> sd_shutdown() make no sense because the sd_resume() will send ssu to
> start sda/sdb/sdc.
> 
> so can we avoid this and ensure that there is no request to sda after
> sda's shutdown() is completed ?
> 
> so that is it possible to modify the sd_shutdown() ? take "sda" for
> example: after sync cache && ssu to stop sda, do blk_cleanup_queue()
> then it will ensure no runtime resume of sda and no more new requests to
> sda.
> 
> then, for UFSHCI host driver, its shutdown() no need and should not
> handle the sda/sdb/sdc's queue and device status, because these
> devices(sda/sdb/sdc) has already complete its shutdown.
> just like part of Can's comment, UFSHCI's shutdown() should only handle
> hba->sdev_ufs_device.

My understanding is that ufshcd_shutdown() is only called if no
recovery is possible, e.g. from the pci_driver.shutdown callback. Hence
the proposal to call scsi_remove_device() from inside ufshcd_shutdown().
It may be necessary to call scsi_target_unblock(...,
SDEV_TRANSPORT_OFFLINE) first to flush queued I/O. Other contexts that
may submit I/O while ufshcd_shutdown() is in progress, e.g. the sd
driver, are expected to hold a reference on the SCSI device with
scsi_device_get() / scsi_device_put(). I think the sd driver already
does that. In other words, no changes should be necessary in the sd
driver.

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
