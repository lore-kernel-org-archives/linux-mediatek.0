Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F20BC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBtukp+iT13bXS1x4ppbbvLuYQYsK1bKT1T8ZuQYnuU=; b=tnVte2/bGF8d4aEo321g6HOcFL
	qvgILOn00QVQVivv5NsNS2oZfk0Gj+1vkw7FK51znH3/gzigQRGi2gaMTeO3Icwa00OskDLm3pRi6
	UtAjxa+Fyad4XsbIqao4O5D1THzTR3VzygwIGnRH2AZWnatZBnBGmhZd0lqUWcVa23mb1FPdmjkn8
	wgfmV644eyLFsz257vt578NCvj6trip3siz49CfdqTfiJeosiUFugi3hFx4mObAJS4GZtqTsYL//T
	braHOzSMR6cW8hlPnTkwhcHm8jQ4pGPHGEMVd/GXayW+QsAo5vpS9wRqN5lMOm1vtOCgouWO/sE9Q
	4pOv5W3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLmD-003X5u-Be; Fri, 29 Jul 2022 08:55:21 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLUi-003MFe-JU
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 08:37:19 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 141so7064090ybn.4
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Jul 2022 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jBtukp+iT13bXS1x4ppbbvLuYQYsK1bKT1T8ZuQYnuU=;
        b=i22YIsoLhKb/wfkY6xp7KMmlRGqwFcE/LUkGQHT3XnBPKXflWCLwDnGhe3Y2v4aBGb
         1bUjxWV41SVHBYhWtYuWL7UwmcyfYGERtfCq+CIffVBUqZMKfwET2uQrvA9ZVJBGytX+
         j/oDivxugVZ2IhpyVx4ou8gTGgTwu7zrhtVng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jBtukp+iT13bXS1x4ppbbvLuYQYsK1bKT1T8ZuQYnuU=;
        b=VCFpBwrj3ECzsScDy2uzvCVGlhGop9EyA2xVtfhR/dxLWJWWeK4aTZtYxhU2KdWyVd
         PBmnoBzMfd1P4w8v9K1FN9qNou+FurU22Up92lwI0iQ9rIPlSqDvgi1Ga0Ezie+j/nGD
         VtyjGHDPKG4RhqkszosBKc1seKEnN41ZKlzKhdbvEIwgBVbQVmzUe/yvqqfvNoQedG1A
         MHkRFw+D+AqpV2A1O3pOlvozx0aMymKUTj982n2ig65QDeDq49D8UCY66F6KkvwjmDG2
         0nUGTx8D+u/58Bcl9kxtHdTyhOrJmimyD5KQwEZ3Y5dW8SATlmvF67sHvmI8AURoLgwV
         ChSg==
X-Gm-Message-State: ACgBeo0LOk0qTx0FAO2hKPyUWUOlVpZXzZGV8SzzXwpg+uaG2Q2EsXi2
	SyqRqWHs/5HOWqKVM/qV1hbibifm727CKu9kzXfaSg==
X-Google-Smtp-Source: AA6agR4Fodc9JOFrHAphSV1LJgvVUjnQBZ8rGzgsx/oQkn3dAk23lZ2WjEVH2IM56ojvT4WwwhovvzIy+j9G9/w1IU0=
X-Received: by 2002:a25:8888:0:b0:671:787e:8b3c with SMTP id
 d8-20020a258888000000b00671787e8b3cmr1820668ybl.478.1659083833529; Fri, 29
 Jul 2022 01:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220729020508.4147751-1-dlunev@chromium.org> <20220729120216.v3.1.I6b7934b96fff0d5ea22531e57c0a11f0ccd1acd8@changeid>
 <YuOV6l/7KoVO4yZp@kroah.com>
In-Reply-To: <YuOV6l/7KoVO4yZp@kroah.com>
From: Daniil Lunev <dlunev@chromium.org>
Date: Fri, 29 Jul 2022 18:37:02 +1000
Message-ID: <CAONX=-f=qnUqVCTuotrEp6MCMk_f+wWj4FPY6skXHHWuitqZiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ufs: add function to check CRYPTO capability
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Bart Van Assche <bvanassche@acm.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>, 
	Avri Altman <avri.altman@wdc.com>, Bean Huo <beanhuo@micron.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Daejun Park <daejun7.park@samsung.com>, 
	Eric Biggers <ebiggers@google.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mike Snitzer <snitzer@redhat.com>, Stanley Chu <stanley.chu@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_013716_737380_93807CC0 
X-CRM114-Status: GOOD (  12.84  )
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

> This is not a valid changelog text, sorry.  Please read the
> documentation for how to write a valid one.
Sorry for that. Though the latest patchset is v4 and that one
doesn't contain this patch since Eric Biggers pointed out the
crypto information can be obtained from device's queue sysfs
node. But I will try to be better further on.

> Something went wrong with your patch, there is no --- line, so git will
> apply it with the diffstat, right?
>
> Did you hand-edit this?

Hm, I don't recall hand editing it, but the possibility of pilot error is
always there. I am still getting used to the upstream tooling and
processes. Sorry for the inconvenience, but as I mentioned, this
patch is dropped in v4 version (and sorry for high traffic of changes
on this patchset)

Thanks,
Daniil

