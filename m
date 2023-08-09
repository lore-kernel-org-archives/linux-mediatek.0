Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B0BC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I7R8nlVGLuiSPOLBhq2QOhIEsWu1cNAXuEA6AAZ6Y4=; b=Pw+Cm+J+2RIAUepHja/6emnW06
	wO0d3pm94u3yLSQpVZef1tlHFJCRAW0EgHWHimC9gW1vCXzeCSTFNGpSoH9CxKGDdShaVFGDO3k1+
	aERBUeBhbVUyTtBCc16fgG+jez4lTb1bkNYnSo1qpEPOxbcs6nzHLSZxVRzlYn6hhzsWIovT+T8a/
	+zJ/H8eeGVwxq5kZ8ndOfI6Sv6chGzY3OQlDHrDNQ/KCNX+1IK9ltXu84imXqgnzFf3tn+OHyJA6l
	n6/xj/5Z9gaRaWoF5K2pPmowsdzbyMYre+g2Ne1+UilPuqB1GKDAGRWyG6XsN83+wwxwLidjEBrfl
	Em2rAwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdws-004IuV-2A;
	Wed, 09 Aug 2023 07:49:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdwo-004ItP-1O;
	Wed, 09 Aug 2023 07:49:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b8b2b60731so41001525ad.2;
        Wed, 09 Aug 2023 00:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691567376; x=1692172176;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-transfer-encoding:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I7R8nlVGLuiSPOLBhq2QOhIEsWu1cNAXuEA6AAZ6Y4=;
        b=gplYjsedbl+L0IMXDxKHXFkPZeM9BKJ6vdw3uzY4RBtaoSoSqNugVSLPiVcFHB6+VS
         1F9tOA7VwRg2TU839OuuOBCz/4mG+v9oV+DBtG9rZXzcxiS+kH1WSeEsv5noTTKNlOrr
         k/bkejas5fOq6sR2HYvbwEVdA62KFSVNFRJgy1vbEpDHSU3Klfhyns64kMeiJeIsy31n
         NUGlpFDMuZfzSVAMxAptr9XrmEKQKK2iHZdrFCUvqxkXoyBWyPMBE2UctCo2EXeAw0zq
         ocscXGUIQ/RRw9j3PYU33dYnln80vFeLbKBsxbqJsoKg4o2DXHJRi9KJCUla5BwV35WT
         18UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691567376; x=1692172176;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8I7R8nlVGLuiSPOLBhq2QOhIEsWu1cNAXuEA6AAZ6Y4=;
        b=ItoqytrdsPgTXqzilXsSf31iGpTF8tM1VoN6TU5dYHtLceyfRcNb4Ej5VdlUkGI/aA
         LVSnEC0M4PqPJg30an75txpptWfDa8pDy+fumAB1r8G6yuC98HVcQLZs9HWWlZJdU2SB
         mf1oS6ryO6vCyXkihx00hDvUtxUbosKwL7G/xFp7wH/NS1q1wAAns9SzTu0keVLsjMwX
         SEINUEpNxSm14DPGw8tfFSTvNIgOq8NSR3xn50Mgp/Bq+UuXgnELMcexncUo6MGSzkPH
         SVnO+FCB6UvPMqsGikoD7OJDGTB2nMRf6j3SV3gWa9/Df1NtLp3IL4LnE2sq0KXWYOsr
         ftVw==
X-Gm-Message-State: AOJu0Yxw7kd423jEcdaXwKqSBjPX6c0TPMwm18FBu21lSVa3KZbmPQrH
	C801zRUvGPAqT3mmH6hCvy0=
X-Google-Smtp-Source: AGHT+IG1mqiqcQOPg+6OklA7lwp3XuUGcNchKQNJtVUmasQCc5+fZq7s0O2q3Rrn9aR1oooYJYwE+Q==
X-Received: by 2002:a17:902:ea09:b0:1b9:e1d6:7c7d with SMTP id s9-20020a170902ea0900b001b9e1d67c7dmr1518767plg.47.1691567376420;
        Wed, 09 Aug 2023 00:49:36 -0700 (PDT)
Received: from smtpclient.apple ([2001:e60:a880:2dc4:934:4e53:662c:983c])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b001b0358848b0sm10359361pll.161.2023.08.09.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 00:49:35 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: Feedback on Qualcomm's minidump (debug) solution for end user device crash
From: Kukjin Kim <kgene.kim@gmail.com>
In-Reply-To: <ZNEJAh0in/fjq6s9@brian-x1>
Date: Wed, 9 Aug 2023 16:49:23 +0900
Cc: Mukesh Ojha <quic_mojha@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Message-Id: <1DAA278D-BDFE-4880-8453-99F098D4E259@gmail.com>
References: <ZNEJAh0in/fjq6s9@brian-x1>
To: Brian Masney <bmasney@redhat.com>
X-Mailer: iPhone Mail (20G75)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_004938_488153_8700E853 
X-CRM114-Status: GOOD (  15.82  )
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


> 2023. 8. 8. =EC=98=A4=EC=A0=84 12:08, Brian Masney <bmasney@redhat.com> =EC=
=9E=91=EC=84=B1:
>=20
> =EF=BB=BFOn Mon, Aug 07, 2023 at 06:01:27PM +0530, Mukesh Ojha wrote:
>>> On 7/30/2023 5:14 PM, Krzysztof Kozlowski wrote:
>>> On 24/07/2023 18:59, Brian Masney wrote:
>>>> + linux-arm-kernel list
>>>>=20
>>>> On Thu, Jul 20, 2023 at 08:32:24PM +0530, Mukesh Ojha wrote:
>>>>> Hi Samsung/MTK/Any other SOC vendors,
>>>>>=20
>>>>> This is to bring to your notice that, we (Qualcomm) are working on
>>>>> upstreaming our minidump solution which is to address the problem of
>>>>> debugging on field device crashes where collecting entire ddr dump
>>>>> would not be feasible and collecting minimal data from the ddr would
>>>>> help in debug direction or even help in root causing issue.
>>>>>=20
>>>>> We have recently posted v4 version here [1]
>>>>>=20
>>>>> Based on comments[2], community is more worried about, if each SOC
>>>>> vendor come up with their own dumping method today or in future and
>>>>> whether it can have a common solution to a similar problem faced by
>>>>> other SOC vendor.
>>>>>=20
>>>>> We wanted to take your feedback if you also encounter a similar proble=
m
>>>>> or maintain something similar solution in downstream which can be
>>>>> upstreamed. This will help us in a way to have a common solution in
>>>>> upstream.
>>>>>=20
>>>>> [1]
>>>>> https://lore.kernel.org/lkml/10dd2ead-758a-89f0-cda4-70ae927269eb@quic=
inc.com/
>>>>>=20
>>>>> [2]
>>>>> https://lore.kernel.org/lkml/CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiy=
ei-u9=3DCv=3Dw@mail.gmail.com/
>>>>=20
>>>> Adding the main ARM list to solicit feedback from other silicon
>>>> manufacturers.
>>>>=20
>>>> The cover sheet on the v4 patch set is available at:
>>>> https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_moj=
ha@quicinc.com/
>>>=20
>>> I doubt anyone follows the lists, so at least Cc some maintainers.
>>>=20
>>> +Cc Alim, Kukjin, Vignesh, Nishanth, Matthias.
>>=20
>> Thanks @Krzysztof/@Brian for extending the list.
>=20
> Hi Mukesh,
>=20
> Since no one has responded yet: I suspect your best bet to land the
> minidump functionality upstream is to refactor it to use the pstore
> functionality that Rob suggested:
>=20
> https://lore.kernel.org/lkml/CAL_JsqK7MHR09U5h01=3DGf1ZLeDVCgZdN-W1hQRH3AX=
+E94_uUg@mail.gmail.com/
>=20
> Brian
>=20
Hi all,

Sorry for the late response and thanks for the asking.

In Samsung side, we=E2=80=99re checking about that internally as well. I=E2=80=
=99d like to know whether the minidump upstreaming is considered to be used i=
n other chipset or some logic of that can be used. In addition, if Samsung w=
ants, own the way upstreaming can be acceptable. It doesn=E2=80=99t mean we h=
ave a plan at this moment though.

Thanks,
Kukjin Kim <kgene(at)kernel.org>=

