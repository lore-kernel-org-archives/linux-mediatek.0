Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 21:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6296C611CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 21:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6296C611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esZQlSke7qcdJTF1eicGTGLLVTtPmqgkTrFNnsxrJpw=; b=gMDuzLBrrqd4F+
	SToKU4+BfpTqEEI+uNxlDXsJP4OWQ9WJmzIW77j5SpzMX231M54p6xlJm9/GU49nd0VuFBdNAFQcI
	GoY3A4M7OBM8HZ+kgXJHTdkdNorQDt0Om44JMpIhl9kcbsADF7GQVNXMm+WtjxpU7yN+Q770c3OHh
	j72zTtmbaurOi57nwU5Jqxisem/AGSx+LO/JxZw7oApvdIky2iHXNgOffvShMhN2wsPXndywWKHmG
	cQqmIadJFZ+44uXQ3N1BYbyRecHrWladVmJYYhZCRhsmZKy8crMm8+ifDfh5qspQt3N420mh7++ZF
	osjgzv0cJDhTEs/Om+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbUXT-008nRt-Kn; Fri, 15 Oct 2021 21:14:51 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbUXH-008nQ6-O4; Fri, 15 Oct 2021 21:14:41 +0000
Received: by mail-pj1-f41.google.com with SMTP id kk10so8095498pjb.1;
 Fri, 15 Oct 2021 14:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qJA65CjIq0sW9pwPjhwz1BOfzReAhhdiyB/dhUgpGh0=;
 b=QBCWc66Fh+whNclqUygP+La6ifBoDet2wHCh1qgo/XrxoY2CajUiXMHhG9O1UumUsZ
 Azw1xccxZlN2Jya8dDyp9LH51ff0Yf4aNYpHlF982G2IHkhw9vZHXCEeEcRRXAWJSgep
 oVWcN9Pql36rQf3qpuliphPy2N5G5dchI8DhJF6qVaKlnv9WPlMUAJJ4pccp+3W0caEF
 S8X5bYwyXCACCfgvZc9uzcWgZYTxG8VRFUvDGTWX6z72MChv0weXcFgV4liO64ZDIJEr
 smoITwVoWoabx40qaLotZ5qhXiXUm50p44QBBQAvJBndIVT0AiD/6dK0Q0av30fQIaHg
 /ZTQ==
X-Gm-Message-State: AOAM53160YpJwX/Ie9LJ4qGREIJ5Y/7Eu+L9tEOrKpyiQCuZIRfWxxmJ
 U+WXAN9Z/eCnEpKakCwpTXA=
X-Google-Smtp-Source: ABdhPJy/NnL/0K/f8CdCsfRJVIOb3LtYfQ6cBP23558YHvEBmVkiIGZyI4brw031JmBB1WCFBwaYqQ==
X-Received: by 2002:a17:90a:f2c2:: with SMTP id
 gt2mr2622207pjb.2.1634332478743; 
 Fri, 15 Oct 2021 14:14:38 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:cbb9:9363:2c17:8891?
 ([2601:647:4000:d7:cbb9:9363:2c17:8891])
 by smtp.gmail.com with ESMTPSA id x30sm5785210pfj.219.2021.10.15.14.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:14:38 -0700 (PDT)
Message-ID: <14930227-aca0-89a0-25ea-727d263f8bf8@acm.org>
Date: Fri, 15 Oct 2021 14:14:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] scsi: sd: fix crashes in sd_resume_runtime
Content-Language: en-US
To: miles.chen@mediatek.com
Cc: jejb@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, martink@posteo.de,
 matthias.bgg@gmail.com, stanley.chu@mediatek.com, wsd_upstream@mediatek.com
References: <fe7bacf4-aa9a-6742-8382-a7c9b31236a7@acm.org>
 <20211015201155.12212-1-miles.chen@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20211015201155.12212-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_141439_819033_B16DA103 
X-CRM114-Status: GOOD (  11.78  )
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

On 10/15/21 13:11, miles.chen@mediatek.com wrote:
> I hit this in v5.15-rc1 merge, I can still reproduce this with v5.15-rc5.
> I found two ways to avoid the crash:
> 1) revert commit ed4246d37f3b ("scsi: sd: REQUEST SENSE for
> BLIST_IGN_MEDIA_CHANGE devices in runtime_resume()") works for me.
> 2) adding the NULL point check in this patch.
> 
>>From the backtrace, dev_set_drvdata() is called after sd_resume_runtime()
> is called.
> 
> sd_probe()
> {
>   scsi_autopm_get_device()
>     pm_runtime_get_sync()
>       __pm_runtime_resume()
>         rpm_resume()
>          ...
> 	 sd_resume_runtime() // crash here
> 
>    dev_set_drvdata(dev, sdkp); // sdkp is set later
> }
> 
> [    4.861395][  T151]  sd_resume_runtime+0x20/0x14c
> [    4.862025][  T151]  scsi_runtime_resume+0x84/0xe4
> [    4.862667][  T151]  __rpm_callback+0x1f4/0x8cc
> [    4.863275][  T151]  rpm_resume+0x7e8/0xaa4
> [    4.863836][  T151]  __pm_runtime_resume+0xa0/0x110
> [    4.864489][  T151]  sd_probe+0x30/0x428
> [    4.865016][  T151]  really_probe+0x14c/0x500

Thanks for the clarification. Given this clarification I'm fine with 
your patch.

Bart.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
