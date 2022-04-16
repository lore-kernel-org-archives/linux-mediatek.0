Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9220EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Apr 2022 04:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPlNluZGONZx+6+WkjRbeGAZDf8O3r6dHZ+K2nZnWkc=; b=Am0rkFq0iASYHY
	mpq5gOFPtuJ2j1eHf+AiKOot5+W9fwmVW5mdCg6GfQSw2x8ZpUji5427Iq0q2sxVaGlOWKRManXSg
	njcBkYK3bSm0hnDVcfOfixKlWIxBaSkl7GXGIaPw2npvMeqhrujIjmfdHtc6FOmrt/2AstTDIuxtE
	7AC1VWfIfoCB/KXbDkNSFeulo6d1akaftWOUl8g0uiDiqBIbOjNlQ9AmUSTafdo84ZcAp8w05KBKO
	mImrkPDkjrhXQZCRXvi99SbAZTyZanr5gRdg/TTAokZyBNTRrJI4Jld0QzwPO6FmRbbhMj1PY6kOj
	Y9IcmExuJsNHljx6Ex1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfaNr-00CF1G-LL; Sat, 16 Apr 2022 04:50:07 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfaNg-00CExJ-Sl; Sat, 16 Apr 2022 04:49:58 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so9785148pja.0; 
 Fri, 15 Apr 2022 21:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n64Ceh0+mncTh8c+PN3WAxiVq0wOhX+10SaNJK7xeCg=;
 b=pzQzcyS+qxEFOp6GZCBE+4cPQXJQ5lIiZIXQS0+fhNILqk8NgbhToBwP4q779XvARo
 zStPhmzCpaSfCQ4BlEUO4IkcqvscvZYv1stUKHBdaVHry64jowsmB1i0rEF2Qa7NXL3Q
 G+QshrJT+T+nKWlmLVS2C4DtJfWqCzVpKcCCX54q9jVnWZC5aBzi5ccocsmR4NbRKXvj
 +ipahmDrnaJ9YU1Fzr0dg3UtflVIhlKxmxAi5mdJ2BGQYwXjPy7x4FaXvLkhUPce4lTl
 amT46CDOWKyWIXGQ8+02EzYbXAydEgN03tq3zn+haC0M81JjHrptL9346sc+UqcTXdLs
 vf2g==
X-Gm-Message-State: AOAM532w/FZBqSeGrQ4gvoTlfCG6W4Oxkht9+/C7JlEU2dFYiApRkJFx
 JeSpk4i03ld5rJc3+Nivqt4=
X-Google-Smtp-Source: ABdhPJwT6to3858USQjNTK1oP4TKo79v1y7v98iKirBSDZhQhO7QnuXHQM8Wa7Lvk5eiXgmaG9AuCA==
X-Received: by 2002:a17:90b:4c44:b0:1c7:1326:ec90 with SMTP id
 np4-20020a17090b4c4400b001c71326ec90mr7502827pjb.87.1650084593598; 
 Fri, 15 Apr 2022 21:49:53 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd?
 ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a17090a3e8400b001cd37f6c0b7sm6129296pjc.46.2022.04.15.21.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 21:49:52 -0700 (PDT)
Message-ID: <3164cd23-28b5-e971-c7a9-1b565b344ed5@acm.org>
Date: Fri, 15 Apr 2022 21:49:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/1] scsi: Fix racing between dev init and dev reset
Content-Language: en-US
To: Alice Chao <alice.chao@mediatek.com>, jejb@linux.ibm.com,
 martin.petersen@oracle.com, matthias.bgg@gmail.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: stanley.chu@mediatek.com, peter.wang@mediatek.com,
 chun-hung.wu@mediatek.com, powen.kao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, qilin.tan@mediatek.com,
 lin.gui@mediatek.com, yanxu.wei@mediatek.com, wsd_upstream@mediatek.com
References: <20220415061243.30229-2-alice.chao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220415061243.30229-2-alice.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_214956_972063_E79F2CA4 
X-CRM114-Status: GOOD (  13.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/14/22 23:12, Alice Chao wrote:
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index 0a70aa763a96..abf9a71ed77c 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -2461,6 +2461,7 @@ static void scsi_evt_emit(struct scsi_device *sdev, struct scsi_event *evt)
>   		break;
>   	case SDEV_EVT_POWER_ON_RESET_OCCURRED:
>   		envp[idx++] = "SDEV_UA=POWER_ON_RESET_OCCURRED";
> +		wait_event(sdev->host->host_wait, sdev->sdev_gendev.kobj.parent != NULL);
>   		break;
>   	default:
>   		/* do nothing */
> diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
> index f4e6c68ac99e..431f229ac435 100644
> --- a/drivers/scsi/scsi_scan.c
> +++ b/drivers/scsi/scsi_scan.c
> @@ -1904,6 +1904,7 @@ static void do_scsi_scan_host(struct Scsi_Host *shost)
>   	} else {
>   		scsi_scan_host_selected(shost, SCAN_WILD_CARD, SCAN_WILD_CARD,
>   				SCAN_WILD_CARD, 0);
> +		wake_up(&shost->host_wait);
>   	}
>   }

The above patch can only work if scanning a host is followed by a POWER 
ON unit attention. I don't think that is guaranteed. Additionally, what 
will happen with the wait loop if the device generates a POWER on unit 
attention after the device has been removed from its parent? 
kobject_del() clears the parent pointer. device_del() calls 
kobject_del(). scsi_remove_device() calls device_del() before the 
request queue is destroyed.

Thanks,

Bart.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
