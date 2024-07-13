Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6D6C3DA42
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jul 2024 20:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwxWyzAfdcoGBJ/UCy39/QZeuk7RCQ2GdHaRtr1hZgw=; b=T8XoWj/NCHytiYM4Vlpzhtd/4p
	8RT9WCQ81fBbkE8I5Nckki9MbNOdGF0qkjxiyLbw3IuthmwsRB6dHhyxnlH7GtzlC+VAg2nj2tYf0
	DoJ8WPu4suFiXuGxlj0cXzNM9fhyCBSJCB2cNiEOthZpk6EmNcTES8umUa6KwWyaVMTQD+fKLb7g6
	7pv2Fp21BnYrG2ZvB6e+TWcjwGuXOVZxXIwSQh82YiB6AlyzaAoOvr5z2JX0vDQrWl4H3/Y0I3hwS
	LIJzfdJgc9R15o2NERxkqBNvbVUc6Xb2qzhVft0GH2KUJyc8/nTvge0d9fcdHPSCNgcov9IH5d9L1
	KeAQabRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSjBJ-0000000380S-3Bij;
	Sat, 13 Jul 2024 20:17:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSjBG-000000037zx-2bLQ
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jul 2024 20:17:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so21069775e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jul 2024 13:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720901836; x=1721506636; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwxWyzAfdcoGBJ/UCy39/QZeuk7RCQ2GdHaRtr1hZgw=;
        b=jAGS1q1tGMcFpzVwoloJHABPxGjXdE17rMxdM2BQA8n10DXiOcu+m601JwdZUmZb1e
         RTpvrMecaLP8PTINRqc0l5glRKEEN/tVKLF9SJJJzY4OPlyQ8ZeCWxgdGt0rNAT+NJmx
         Z/DAgz6qAXHKvzpsF40+ULK68tZIsag4KZXzE50GwuVc6fX+a4dQlfKQBn8S96J2h4fo
         g7bN/33s3mgeQU93j96VrPTFABzNJz4WJz2nTS57hvETlgtCs4dNGZk3MBEEuQ9N9yYS
         EOjlTFNY4fXZyd9Z6N3eNbmPRbA+OD6Ce20Q0OLtcfEChkHBp5dMxK4O0ebo0mlODZbs
         YmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720901836; x=1721506636;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwxWyzAfdcoGBJ/UCy39/QZeuk7RCQ2GdHaRtr1hZgw=;
        b=QOZrvEfvtjfI1jG9+wQxmMF7LwbDmz8yA+im6iTgD65iZ8vb5hrlKXWbvRROkwW9b4
         tnOKZGhHWZAKavpovtOml4o7FqIGC3Gj2MNuxyM1Kdv0mv1jDwKmOGL25uGUdsnuf+eY
         C5zcjpEWGbXWTBgM2HsIJwGiG3wyx/3qjHnSJUspRn2Sb/ImAFeuKxtHbz5kRKmiH1aB
         rLdWBpKG6Qs36F872VolyXdcY4cNMCuF5Gf8ymaqyh5p0PpajFbRiywAh8MjTLOqmKOQ
         P8LFOm5ZcBOGJBGZlC6ADtGzbb4+19qgBssxv7DWKbZ+sv+CcA1j9go/JgU6tyScEHaf
         5Hag==
X-Forwarded-Encrypted: i=1; AJvYcCUlM9T9wG+MV9VLaoq3/nbJn5zkUndN+1rExGnWFZBUxs9xLBFW8ypqO3S2TXSElrerbecMogqYqQF4DMkKOY/hW4mDXSr6tfi5KmcOBLsdtFYo
X-Gm-Message-State: AOJu0YxuRwyXd5TnU6TgeWk6FPNl6BHIek2cQCSNvQqXOCScQ22axg6y
	AC3A1KySy4aDOnLeR54THfyfZo5e0NxCKg9Y+/kjxB6NVBS1VfeU
X-Google-Smtp-Source: AGHT+IFLBhP1h22J99UGV67Li6bdAzuvqEcIujjr6lLKXMQgpX5ElANP8+exxtSUOtHMXwi3gvGQaw==
X-Received: by 2002:adf:f990:0:b0:367:89fd:1e06 with SMTP id ffacd0b85a97d-367cea966f2mr9794804f8f.36.1720901836204;
        Sat, 13 Jul 2024 13:17:16 -0700 (PDT)
Received: from p200300c58740f79d67fdfc896b2e8c6c.dip0.t-ipconnect.de (p200300c58740f79d67fdfc896b2e8c6c.dip0.t-ipconnect.de. [2003:c5:8740:f79d:67fd:fc89:6b2e:8c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368111d3e7dsm1783521f8f.87.2024.07.13.13.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 13:17:15 -0700 (PDT)
Message-ID: <2f9038932ec77ce37b18667a3bace06e88a547f4.camel@gmail.com>
Subject: Re: [PATCH v1] ufs: core: fix deadlock when rtc update
From: Bean Huo <huobean@gmail.com>
To: Avri Altman <Avri.Altman@wdc.com>, "peter.wang@mediatek.com"
	 <peter.wang@mediatek.com>, "linux-scsi@vger.kernel.org"
	 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
	 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
	 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>, 
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>, "chaotian.jing@mediatek.com"
 <chaotian.jing@mediatek.com>, "jiajie.hao@mediatek.com"
 <jiajie.hao@mediatek.com>, "powen.kao@mediatek.com"
 <powen.kao@mediatek.com>,  "qilin.tan@mediatek.com"
 <qilin.tan@mediatek.com>, "lin.gui@mediatek.com" <lin.gui@mediatek.com>, 
 "tun-yu.yu@mediatek.com" <tun-yu.yu@mediatek.com>,
 "eddie.huang@mediatek.com" <eddie.huang@mediatek.com>, 
 "naomi.chu@mediatek.com" <naomi.chu@mediatek.com>, "chu.stanley@gmail.com"
 <chu.stanley@gmail.com>,  "beanhuo@micron.com" <beanhuo@micron.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Date: Sat, 13 Jul 2024 22:17:14 +0200
In-Reply-To: <DM6PR04MB6575CF59300D4AB5E1BE1377FCA62@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20240712094355.21572-1-peter.wang@mediatek.com>
	 <DM6PR04MB6575B81B788F260A8C640684FCA62@DM6PR04MB6575.namprd04.prod.outlook.com>
	 <edbedd4e992dd0adb93adbd45a74614c4c0f626d.camel@gmail.com>
	 <DM6PR04MB6575CF59300D4AB5E1BE1377FCA62@DM6PR04MB6575.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_131718_825888_26011BDE 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2024-07-12 at 12:31 +0000, Avri Altman wrote:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hba =3D cont=
ainer_of(to_delayed_work(work), struct
> > > > ufs_hba,
> > > > ufs_rtc_update_work);
> > > Will returning here If (!ufshcd_is_ufs_dev_active(hba)) works?
> > > And remove it in the 2nd if clause?
> >=20
> > Avri,
> >=20
> > we need to reschedule next time work in the below code.=C2=A0 if return=
,
> > cannot.
> >=20
> > whatelse I missed?
> a) If (!ufshcd_is_ufs_dev_active(hba)) - will not schedule ?
> b) schedule on next __ufshcd_wl_resume?

hba->pm_op_in_progress is true during __ufshcd_wl_resume(), will not
schedule update work.


