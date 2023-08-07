Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE7AC001DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSkCa7A9TXUS3VXQ5McnNNZT+8+UROTnmjHayz9OLCM=; b=xxnyS7tjlXDVFp0dDkvDaytatN
	+HsztSw478HIdVFSOOOl7ffPnwDC4cX3CR8+WFP6GLfMuoSrqo/yr9GfpuhdbI1ByYTCoozLN2ubS
	OX+8EV/C7HgCL+Ew/uWf3qHIssA+8uVcb6ej8vtvgQP5V7Buajt6NiW6yxSAGFWLlY9ZItS4uK0W7
	QhQCmJGJV+CZ/46abIYIU/gv5JGpwfdq4SxRqBelKGroPXdDdU497eevkkcPYV2h6ma/fzJCbZVPU
	VDA/n6hZRvMX8FsJGaNHoUviuC3v8/ylXzH2m9RsdG10blSzxNmwNFlINXqBJNvfVLi1bjGgM7cp0
	wENL3S4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT1qw-0001IS-37;
	Mon, 07 Aug 2023 15:09:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT1qt-0001Gn-1p
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 15:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691420935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MSkCa7A9TXUS3VXQ5McnNNZT+8+UROTnmjHayz9OLCM=;
	b=JyUWdC1+dQMg1jkeNv4Ru7IOgiSahDx8iSTkjbffzuQdrVAhBywgrkPitr+GgxMpu7tKM+
	E1eUljOY6kJ1Is5nKXGX8qho48Q+eaxa82mOU7JLiUuOm1ioRHaElxc0YZvR1JzJVZDMQr
	juaRCPk1Dkg+/ySlNBD9DbgUDcDSGEY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-b2IvnBauNEiXkOA0sTDbrA-1; Mon, 07 Aug 2023 11:08:53 -0400
X-MC-Unique: b2IvnBauNEiXkOA0sTDbrA-1
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-d41fa6e7103so4073815276.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Aug 2023 08:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691420933; x=1692025733;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSkCa7A9TXUS3VXQ5McnNNZT+8+UROTnmjHayz9OLCM=;
        b=XxOW4XWLSANzuQNDRK36dn4JGfAbH32v6eLtLZQ5uy0WwNIIxEEkFgoYXdSjxn/OZU
         qmuqnVCQLyVajtGY9Q9ODTQzW0qScm0l4r7AuAgiPrw30MB+5sZvDdYHdKwuGTwnqqKF
         2u9GgrmevSjyh7zWZQYvtcVq5h2leJch5URqiGeYEqv/tmy+iQcXsFKmP+cIfpppq8I1
         KchEMSx22M2vDxj1E6xDIwGCfUXkpeYwFcGKqFN/KbCpxxl9YkB2qs7Aj6jco6VhTxj5
         MYDzsyKUpNVLs/cGkHHRK4p+rR/Z6iXuIAKQv4sB567gafDwNZznplLiJB2TUwsnHmOe
         pbGA==
X-Gm-Message-State: AOJu0YzQuy22YxTI6MiUKcCyDCCvjSONZiP+wQ0YdZiDB6Y9jT8/+6sQ
	olD8p7GIgEVhaMmizSLDFT8rs5E//Mmqq/RQqibSPRJJgNtXVM3uN+hvFdUHJrDZit8/YYYNm2B
	0oBhJ2lt5YeyQPpsT6azjwpLE/ldJ1LJx
X-Received: by 2002:a25:29c2:0:b0:c62:2320:2598 with SMTP id p185-20020a2529c2000000b00c6223202598mr8059914ybp.62.1691420933343;
        Mon, 07 Aug 2023 08:08:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFwHp4dDJnIOl2S3nXfBjqj/u/Iz50+0PkY1Lm8o+KMODDnct/IB/u4h0wbSKzpgdvXF7AeQ==
X-Received: by 2002:a25:29c2:0:b0:c62:2320:2598 with SMTP id p185-20020a2529c2000000b00c6223202598mr8059891ybp.62.1691420933058;
        Mon, 07 Aug 2023 08:08:53 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id a10-20020a5b0aca000000b00d1dffdd7a97sm2250323ybr.57.2023.08.07.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 08:08:52 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:08:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: Feedback on Qualcomm's minidump (debug) solution for end user
 device crash
Message-ID: <ZNEJAh0in/fjq6s9@brian-x1>
References: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
 <ZL6t/sZTZBfvSYOm@brian-x1>
 <15caeb52-b670-9000-fa2b-b8d1b8485016@kernel.org>
 <81b15738-615d-a039-7bc3-22aa5b3a54bd@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <81b15738-615d-a039-7bc3-22aa5b3a54bd@quicinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_080859_670589_6BA57DD2 
X-CRM114-Status: GOOD (  26.66  )
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

On Mon, Aug 07, 2023 at 06:01:27PM +0530, Mukesh Ojha wrote:
> On 7/30/2023 5:14 PM, Krzysztof Kozlowski wrote:
> > On 24/07/2023 18:59, Brian Masney wrote:
> > > + linux-arm-kernel list
> > > 
> > > On Thu, Jul 20, 2023 at 08:32:24PM +0530, Mukesh Ojha wrote:
> > > > Hi Samsung/MTK/Any other SOC vendors,
> > > > 
> > > > This is to bring to your notice that, we (Qualcomm) are working on
> > > > upstreaming our minidump solution which is to address the problem of
> > > > debugging on field device crashes where collecting entire ddr dump
> > > > would not be feasible and collecting minimal data from the ddr would
> > > > help in debug direction or even help in root causing issue.
> > > > 
> > > > We have recently posted v4 version here [1]
> > > > 
> > > > Based on comments[2], community is more worried about, if each SOC
> > > > vendor come up with their own dumping method today or in future and
> > > > whether it can have a common solution to a similar problem faced by
> > > > other SOC vendor.
> > > > 
> > > > We wanted to take your feedback if you also encounter a similar problem
> > > > or maintain something similar solution in downstream which can be
> > > > upstreamed. This will help us in a way to have a common solution in
> > > > upstream.
> > > > 
> > > > [1]
> > > > https://lore.kernel.org/lkml/10dd2ead-758a-89f0-cda4-70ae927269eb@quicinc.com/
> > > > 
> > > > [2]
> > > > https://lore.kernel.org/lkml/CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com/
> > > 
> > > Adding the main ARM list to solicit feedback from other silicon
> > > manufacturers.
> > > 
> > > The cover sheet on the v4 patch set is available at:
> > > https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_mojha@quicinc.com/
> > 
> > I doubt anyone follows the lists, so at least Cc some maintainers.
> > 
> > +Cc Alim, Kukjin, Vignesh, Nishanth, Matthias.
> 
> Thanks @Krzysztof/@Brian for extending the list.

Hi Mukesh,

Since no one has responded yet: I suspect your best bet to land the
minidump functionality upstream is to refactor it to use the pstore
functionality that Rob suggested:

https://lore.kernel.org/lkml/CAL_JsqK7MHR09U5h01=Gf1ZLeDVCgZdN-W1hQRH3AX+E94_uUg@mail.gmail.com/

Brian


