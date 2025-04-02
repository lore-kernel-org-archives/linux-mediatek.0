Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492E6C28B20
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aqgbCkNx0PW0vbsTMdXqyfUcPH4h5hP0whKc+xvuD8=; b=C9egtKjH08l+WbntYkFX/zfeMM
	kbieSPOv+OuiqF/bMyu0WYM29K1BkCZYn8iOLm4i5RQQZL+D5eg9X9YIkbBAEI16+NQZPvIXzym3O
	52JXF0eZEuiGXr43kD/7IMNpcbcVJhxfLosxzGXLEWVB8FSJHVvW//2obqBRC+ERk8ANEZCHc9Kt6
	SVtrWhU9mZhUeI2XGImlvbsML961kTdKfrqTx3p21snyEviXjinbne+41wiE6732kk0JaNNWGIqiO
	beTqWsWIWzOHmIG2DVxFffmb+Sq+v+U95elitDreePgvsgFkBVTsmGps2aXNwYQdewsSAKETvoCJ1
	+NGj4r6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsuM-00000005RZa-0ZoX;
	Wed, 02 Apr 2025 07:53:10 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsqq-00000005QqT-1jVH
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 07:49:34 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso11053191a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580171; x=1744184971; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2aqgbCkNx0PW0vbsTMdXqyfUcPH4h5hP0whKc+xvuD8=;
        b=tnXGLXAeLkJTOshxynfoQ4yD1nMUg3XXTKIemP6bTOfXJoEp6Z5eqjzUXe2DIhrcUt
         +zIBMOXWffaxCP2AIowanzECVpLW2j6yr1eo7hDiZoBBCV2+bVUq6z7rJn4PTRa2bN3S
         49p7mQATCHxftwXCXzp90TcQOTTIwnxXgphS6VeQLMlSFBadkNSJLSxRCWqJ5RUl+NBl
         5C/Uh0hM/0pXFqNyNYYUaWPuQd7GoPSqj4pqS+sxAJHrGIPXiGl8BSC5CC2bO1iRqGB7
         uVxGo52QYneX6lzyJxigBXRXg3Qoh+pJRtLbbpBcu/2oCt+H9oWtVxyM84jSZWgfn+kY
         CRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580171; x=1744184971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2aqgbCkNx0PW0vbsTMdXqyfUcPH4h5hP0whKc+xvuD8=;
        b=nEWKFM9BFFxPmV0fyHz9Owk4BcMzh3eqSfQ/c5/gZyMU7ELpxzdRlFl4P6boCNMuX5
         llH7TEOCZiESOmgLF1mr3p00klnBID6C6oQyX30Sk6lUfCAwbq/Evsu2irm+mg0yr6tQ
         Z94t35cu/xvqIdqBS747/2UdB+PAoH1VlKllU4MMv+ln4hdcmwDS1VaLsysp6U/0I4nH
         gbeMZtzI0ZEFdskUauPnnL78mIXZEV2Jr2VAwDuJlBdnX+/XxLonKqq3KevxfCD9qLtZ
         NKfc5ayPys5DvQu5JWF+pIFv6m/6xqVgMRLkVHt5a+XVtndnznFWnZMly1zad78Ypf2Y
         WxeA==
X-Forwarded-Encrypted: i=1; AJvYcCU6xnbuD5OuQP8jQAk+WoJETBEExckBWhh13l07+i8trluqcMSNySD8FvXH+We55HvSPkEKodl4delYJrMRuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2n49BGuMA3TXF70movDOkAcXljFFNgnCcH1z3EAN/i4lzKLPk
	eMWz0UxTRMW/DBKmxj2Y8KuROorTaU/oSr2ome0l1t4aaOR7u1tAhQLUgLomzw==
X-Gm-Gg: ASbGncuiKN0G2QswrI57OeSK5ScypBG0cYvcDMMMPfWvaCaylwd9NczdpZxRmzCsrJE
	DthW2IiAOYlE/fftAJX0nlGa6aoRw8tR9JgTB5E0ljnue/7nx++YhH1y7DgG26rddyY4VykTaDt
	PK/qkaEBmcUvD1+Bvg8TRqpX2yT80jXH6i9AcInMmNRgxMijD82SXLZ+7/pPYQsSTFw3Ya0cE59
	Vmv2WdL0NqDVVWfvLf5JZC7IqHA1IAD+ZU41WEHzl9aq+eGHM19PI/eiTYYDJM2E0YH7U5B6HhD
	MzgJxYVSrFMQwo5I92HOJRmnZ5S0KfidK+wSIJXI5a7L4rVNp5v0Z8O0
X-Google-Smtp-Source: AGHT+IH8Jzdp+kwIVinSdsTnAiNYI68lWe6D/QP0YRmgVUgFc10NP2fNsve2H8szQGsEUFhU7VB1aA==
X-Received: by 2002:a17:90b:2b88:b0:2ff:62f3:5b31 with SMTP id 98e67ed59e1d1-3053216ddc9mr24513921a91.29.1743580171478;
        Wed, 02 Apr 2025 00:49:31 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f83ca51sm892730a91.13.2025.04.02.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:49:30 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:19:23 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
	Arthur Simchaev <Arthur.Simchaev@sandisk.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>, 
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>, 
	"peter.wang@mediatek.com" <peter.wang@mediatek.com>, "minwoo.im@samsung.com" <minwoo.im@samsung.com>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bean Huo <beanhuo@micron.com>, 
	Keoseong Park <keosung.park@samsung.com>, Ziqi Chen <quic_ziqichen@quicinc.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Gwendal Grignou <gwendal@chromium.org>, 
	Eric Biggers <ebiggers@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: add device level exception
 support
Message-ID: <yzy7oad77h744vf2bdylkm4fronemjwvrmlstnj6x5lzjxg672@zya6toqv4aeg>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
 <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
 <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
 <3d7b543c-1165-42e0-8471-25b04c7572ac@acm.org>
 <4cb20c80-9bb0-e147-e3c0-467f4c8828ba@quicinc.com>
 <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_004932_464871_885A37B1 
X-CRM114-Status: GOOD (  15.90  )
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

On Fri, Mar 28, 2025 at 07:02:20AM -0700, Bart Van Assche wrote:
> On 3/27/25 5:45 PM, Bao D. Nguyen wrote:
> > Thanks Bart. How about we change the current utp_upiu_query_v4_0 to
> > 
> > struct utp_upiu_query_v4_0 {
> >          __u8 opcode;
> >          __u8 idn;
> >          __u8 index;
> >          __u8 selector;
> >          __u8 cmd_specifics[8];
> >          /* private: */
> >          __be32 reserved;
> > };
> > 
> > Depending on the opcode/transaction, the cmd_specifics[] can be type
> > casted to access the LENGTH, FLAG_VALUE, VALUE[0:63] fields of the QUERY
> > UPIU. The __u8 array[8] would also prevent the compiler padding to the
> > data.
> 
> Are there any user space applications that use the osf3/4/5/6/7 member
> names?

Yeah, we should be cautious in changing the uAPI header as it can break the
userspace applications. Annotating the members that need packed attribute seems
like the way forward to me.

Though, I'd like to understand which architecture has the alignment constraint
in this structure. Only if an architecture requires 8 byte alignment for __be32
would be a problem. That too only for osf7 and reserved. But I'm not aware of
such architectures in use.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

