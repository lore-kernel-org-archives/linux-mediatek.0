Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E1BC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 07:12:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4BC223E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 07:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4BC223E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vU9weIp79SVlsDZFxvWFlGIJvwVKdjQbDCRjNArol6A=; b=n7bHb6rqOxME5uacq59696Es1
	9N1K0zyK4nhER9C7wQWWw0iDlO7CoxaBLDXxGrN43BEUeK+oBLZ6V5aAatdsblF5Pw+K0VfLt3rfc
	20WECh1Zs92KwxoEe/dMf7Yyv1UnPx2w1xU1i0xx51Fknul7uOjJQ8Hxnh+yFZJ1h8S6/JX/XqAzH
	DVAvPi0njgsZXuqo6vpZuN7p0t9ZQQqKBpJqgRkc7tdDgKkCqB2aYzHA2EgojfprPQqShHgkdpuUp
	cIgqt/faWqZLRXZNTETpS20RE2x1ca27bDLzxwkzBPn5VUo4dWLYvMzq7F78/8jNDteW3yOW5/56o
	5wGJG06Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Ohd-00032A-N5; Mon, 18 Jan 2021 07:11:53 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Oha-00031f-M9; Mon, 18 Jan 2021 07:11:51 +0000
Received: from [192.168.0.114] (unknown [49.207.196.48])
 by linux.microsoft.com (Postfix) with ESMTPSA id C164420B7192;
 Sun, 17 Jan 2021 23:11:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C164420B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1610953908;
 bh=V0aE8EFUyP+cRHKEGBZKB3N9pQMGLB+GauNbKYpryGM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=onZZkLEwbqcSVkIiu80wnBdOjg1oMz34fTyp9AadBIPBFOlkNmZhdqzZOoew0UWUB
 1MDe14FYNWYBi2KB6keTBrIjQKe/GbUIeDDEe4fawYqZyxTnheYg1iYqTEcNqkT1kh
 hs9yeHxcILe9+i/L5pi6dsakpJvF01uEaVqAYrX8=
Subject: Re: [PATCH v3 14/19] crypto: qat: convert tasklets to use new
 tasklet_setup() API
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Allen Pais <allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
 <20210112014650.10887-15-allen.lkml@gmail.com>
 <20210114175109.GA8629@silpixa00400314>
From: Allen Pais <apais@linux.microsoft.com>
Message-ID: <94926b18-2e1e-0b85-41b2-a7e894d21998@linux.microsoft.com>
Date: Mon, 18 Jan 2021 12:41:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114175109.GA8629@silpixa00400314>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_021150_816137_6E5C2B10 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: alexandre.belloni@bootlin.com, aymen.sghaier@nxp.com, heiko@sntech.de,
 qat-linux@intel.com, jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, herbert@gondor.apana.org.au,
 horia.geanta@nxp.com, k.konieczny@samsung.com, schalla@marvell.com,
 krzk@kernel.org, linux-rockchip@lists.infradead.org,
 ludovic.desroches@microchip.com, thomas.lendacky@amd.com, arno@natisbad.org,
 vz@mleia.com, gilad@benyossef.com, gcherian@marvell.com,
 linux-mediatek@lists.infradead.org, lars.persson@axis.com,
 matthias.bgg@gmail.com, john.allen@amd.com, bbrezillon@kernel.org,
 nicolas.ferre@microchip.com, linux-crypto@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



>>
>> In preparation for unconditionally passing the
>> struct tasklet_struct pointer to all tasklet
>> callbacks, switch to using the new tasklet_setup()
>> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> I have two minor comments:
>    * Patches to the qat driver have the following headline
>          crypto: qat -
>    * Checkpatch reports two alignment checks when it is run with --strict:
>          CHECK: Alignment should match open parenthesis
>          #33: FILE: drivers/crypto/qat/qat_common/adf_isr.c:248:
>          +               tasklet_setup(&priv_data->banks[i].resp_handler,
>          +                            adf_response_handler);
> 
>          CHECK: Alignment should match open parenthesis
>          #62: FILE: drivers/crypto/qat/qat_common/adf_sriov.c:57:
>          +               tasklet_setup(&vf_info->vf2pf_bh_tasklet,
>          +                            adf_vf2pf_bh_handler);
> 
>          total: 0 errors, 0 warnings, 2 checks, 83 lines checked
> 
> If you prefer I can resubmit this patch with these two changes.

Thank you. I will fix them and re-submit.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
