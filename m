Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F9BC2D0DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 01:34:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD642080D
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 01:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxzihsWD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKSl9LsH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD642080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FMga047bHNPCuTFC18Y7flE58hlR3IWdym2f7a3Edc=; b=hxzihsWDe0sLBL
	8YelJ4BZx1N3txQPseougtdHCqa1itopck8fzpbqj3KVkd1v6sHWsOAlEGbKpYqiQLPRZ/Fn5GUXg
	x42h2UZJGmJAhGCY435ruLH2SddxUlar6Nn1znleMxAI5mG1Ll1x4LUjrgqdin7r4RDKWY0bfMfP/
	rlyV/S9Qtiz7VgEBflH1vZIWbUb4rELuP3WNGzdx0lYu1YO3zAf1TPABX7ZDq1PluwtzHoaJVTRFJ
	Bpy/OU0fa+ywW0GF17gcYX/OIbJWvoEaoE9pik0Ine8OpdGxGiuvmBE41Iu5BR2BHcxUsw1bzLEg7
	m7wnNrh7BhjyanKpapYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikeWI-0007T9-VM; Fri, 27 Dec 2019 01:34:26 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikeWF-0007S6-CD; Fri, 27 Dec 2019 01:34:25 +0000
Received: by mail-vs1-xe44.google.com with SMTP id p6so16124339vsj.11;
 Thu, 26 Dec 2019 17:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2NZUOXB+u4N/6ynLgzIx+P3HGegc5/3CrzlQhhVkNg=;
 b=hKSl9LsHyLf6H23TKYquoRCv47amnB07IAyIWTFA9xS6edi3vbQWpcM2zU6pybyxEU
 dp+PpHmvMbMNCW2aOsz66YpRfNTAfNegZlNr5HVVZVFv5Fq6z27Z0chyKa1+aLB4q/2r
 GdVY2xhVnBRRh50DSgotuxalNVk9415GL1lhux1GUGgRHsF4hPxu1dBrDVVxx03+RUE/
 9+VGwm8yjt4qA1RSySKH+kcNmD8gq06d0ilNk9gUCN04JqE2a/r+wpP5olPyJtN21g52
 fa21lrcwK375iWKayzpmyVMMYtdIPJnP8I+HHhfhfE41ujSu7UOUhpd5lhOa3F9vlxQu
 8RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2NZUOXB+u4N/6ynLgzIx+P3HGegc5/3CrzlQhhVkNg=;
 b=eh/8t35bp838E2TrqDQ7zp5ed6wtCCbvBNrorhkXV/dPGi6gLw41L+PIZklp+bvxF8
 TvjVYHSBfR9DuI9pjJ8nd3zaC6whV9BViTULar71wXBPkrzniWk7C2gXgEP8KidAXxXA
 o0OUzRlgVFAho1SRVTt8WVKGvfxA9w+3X+UbQ02bgXLUEBjgXmb/eEuG4yIDQt6KvNVp
 JyREpU4jordGQdFIGSuTk6x3t6Shsbc9UTBHa4vK1SA+fqNopgee/pbvzErHXFT8iOHE
 iuA6mNwnvypAjlt3ajwgJ5UCUQTp1gnq6wmRNjIy8UbJ+A3ShyuRMXjBV/qsXsw308cg
 zwNw==
X-Gm-Message-State: APjAAAVh6pahHOZ8KfMNED82F7V3LvkMcXzXLo7Ft2vYjM7dtXba388u
 a9Q3IgJqDPXQaTvBJuqq+fPdajcFTjN0qMgabAc=
X-Google-Smtp-Source: APXvYqyVeOGbvgWGe1iD9awj8wB/SgMSBPry9zyGE8kBSWztrseHrfYrKTMNOXiqV0LTSPsEceV4deRha4vbzTbFBjY=
X-Received: by 2002:a05:6102:3102:: with SMTP id
 e2mr27328735vsh.179.1577410461880; 
 Thu, 26 Dec 2019 17:34:21 -0800 (PST)
MIME-Version: 1.0
References: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
From: Alim Akhtar <alim.akhtar@gmail.com>
Date: Fri, 27 Dec 2019 07:03:45 +0530
Message-ID: <CAGOxZ53wWCcJJpcO3BRDuOKS=gsNmYd=EjU3YEo+8z68iT+EiQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] scsi: ufs: use existed well-defined functions
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_173423_436264_944F69C1 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, chun-hung.wu@mediatek.com,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 Can Guo <cang@codeaurora.org>, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stanley

On Tue, Dec 24, 2019 at 6:31 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> Hi,
>
> This patchset fixes two small place to use existed well-defined functions to replace legacy statements.
>
> Stanley Chu (2):
>   scsi: ufs: unify scsi_block_requests usage
>   scsi: ufs: use ufshcd_vops_dbg_register_dump for vendor specific
>     dumps
>
>  drivers/scsi/ufs/ufshcd.c |    7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> --
For this series,
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> 1.7.9.5



-- 
Regards,
Alim

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
