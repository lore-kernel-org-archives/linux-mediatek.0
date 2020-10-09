Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6802BC433E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 15:53:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D684122261
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 15:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UBNsbBMc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="mdp4+OLa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D684122261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=glsccRsOe7JpSBo6yJzNliJqZ7nWdN2Pz34TQOQ8Yxc=; b=UBNsbBMcmELbpLecjt+BLRvgJ
	eObpVv40aW1ULCC92JawzvwXs24P+C/+V2w05aQaz55fCcJFD74SXQaS5XwCza6eJyqi+ZncRuukg
	3KjKKgx4cDQqwbWKFpnL0AAg3N1qjMYrRhFNxL/5CdEk02etsSx6V51kk0YcO16HDgfQWre1fjHN+
	BIpWNcPvMLJxEjYmmhpyio6ov7fggbA1zFyaFM6IRongdS76i9AXh9eBzX138vvwV0knN3wFmoRnW
	/PkKHnnk5M5/KrHoL0SUGexL2hv/BPYH3IU+uPHen5AVOrdK37of3onVyIqgRZJG4rcgUCPEJtMOu
	bRlse3J6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQuhj-000085-7r; Fri, 09 Oct 2020 15:53:11 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQuhg-00007b-Tc
 for linux-mediatek@lists.infradead.org; Fri, 09 Oct 2020 15:53:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602258788; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=FCcoCjeIgNDChEs4nmbWWhZJ5N4JZK1NxRR+iAH7hlw=;
 b=mdp4+OLah4cZBshQvux5JCh6Kp8IaKwMcXO1A1gd2qSpbbcAauNBEnQki15FjcBZSm7e396w
 d7cN9xqEnceKG1OO2C4ZaxADKBERoBENgf/e4LNiA+UB5t2cnCf3h3cJMQDKu8W4bzxXP2GO
 eIshx8sIXv0KQa4OhYnRqvqODSc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f80875f588858a304882ac5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 15:53:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5DD06C433C9; Fri,  9 Oct 2020 15:53:02 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 85058C433C9;
 Fri,  9 Oct 2020 15:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85058C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [PATCH 01/10] mt76: testmode: switch ib and wb rssi to array type
 for per-antenna report
References: <20201008112904.10620-1-shayne.chen@mediatek.com>
Date: Fri, 09 Oct 2020 18:52:54 +0300
In-Reply-To: <20201008112904.10620-1-shayne.chen@mediatek.com> (Shayne Chen's
 message of "Thu, 8 Oct 2020 19:28:55 +0800")
Message-ID: <875z7js8fd.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_115308_987728_8DB25CC9 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Shayne Chen <shayne.chen@mediatek.com> writes:

> Change ib_rssi and wb_rssi into array type, since they could be reported
> by per-antenna.
>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>

This is cosmetics, but usually Reviewed-by is added before s-o-b.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
