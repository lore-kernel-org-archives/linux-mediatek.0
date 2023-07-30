Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00103C04A94
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jul 2023 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8SHxpQecBQzxw4oYXepudXcAwtFIhYvX2Iw6MQqTIs=; b=Ccc4NX+AKz7es1ZXcLnKBoOMAs
	LrOrh9PKDf2qphVKnZSQrBDVGb2HJ1ejyMY8UEvOY9NdDpRgJeZKjctkiNVIT11m2C2gg93G46L2d
	vEJVa481hmrshjfSMv1MR43YifIiZ5SIqlZa3u6ymX0SPPizTWp0XOPshk57q5sgQISxNA90Yw6S2
	m+L5HISBwBYw5ro1ICKNjot9SRfMLjdD84Mrrf6HbJGGiA366ZMzebSkUAMiSlVjwZp7yuF0ACPhJ
	WDDDi+TBqT2j2pjoXzJfDjFI2TDaRf6YkZo1rJluXENSvExaqTdwgZr96kRQR/RdHC6b9/Dhxc/Fr
	iS57jUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ4qj-00BFWP-2L;
	Sun, 30 Jul 2023 11:44:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ4qg-00BFVU-0o;
	Sun, 30 Jul 2023 11:44:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC3E660C07;
	Sun, 30 Jul 2023 11:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276ADC433C7;
	Sun, 30 Jul 2023 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690717472;
	bh=OS6JHCZoJbPzUiN8ZwsAyWz7H87me0X8MFKTbJ1BfOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HnK4fZF8FSrUTtwOvRB5A9/Ik1QvD2zySIifyrj8TjHOk7aEztdxN4z7AW97ML6Jm
	 r8Ctcj4WSSWv9jrjIPwKXcvDwrJP2QXZ4bySRSUwxCqDt82z/gAacU2+hkLAkBPzfE
	 uNh7x+TIbSqgKrStcHRG2teWRwdd+UwwcFwWnw2gMhtcRx0UOigQdw+MyK2MlIcgzd
	 4+WeGNnPXaRKZWrOmcrTQlOgdJ6zQQBOH7l7fg64SWjd7V3p2zlmsx2BhvJe45yArU
	 ljHY89EgjRUagpv6s+yb8JRjJsMCG0nX7A3/CKgBzq5GTXw59yO1xOQoYBW9kP4VIl
	 jl595Tlaj0REw==
Message-ID: <15caeb52-b670-9000-fa2b-b8d1b8485016@kernel.org>
Date: Sun, 30 Jul 2023 13:44:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Feedback on Qualcomm's minidump (debug) solution for end user
 device crash
Content-Language: en-US
To: Brian Masney <bmasney@redhat.com>, Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lkml <linux-kernel@vger.kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
 <ZL6t/sZTZBfvSYOm@brian-x1>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ZL6t/sZTZBfvSYOm@brian-x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_044434_356223_A2CD7829 
X-CRM114-Status: GOOD (  15.89  )
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

On 24/07/2023 18:59, Brian Masney wrote:
> + linux-arm-kernel list
> 
> On Thu, Jul 20, 2023 at 08:32:24PM +0530, Mukesh Ojha wrote:
>> Hi Samsung/MTK/Any other SOC vendors,
>>
>> This is to bring to your notice that, we (Qualcomm) are working on
>> upstreaming our minidump solution which is to address the problem of
>> debugging on field device crashes where collecting entire ddr dump
>> would not be feasible and collecting minimal data from the ddr would
>> help in debug direction or even help in root causing issue.
>>
>> We have recently posted v4 version here [1]
>>
>> Based on comments[2], community is more worried about, if each SOC
>> vendor come up with their own dumping method today or in future and
>> whether it can have a common solution to a similar problem faced by
>> other SOC vendor.
>>
>> We wanted to take your feedback if you also encounter a similar problem
>> or maintain something similar solution in downstream which can be
>> upstreamed. This will help us in a way to have a common solution in
>> upstream.
>>
>> [1]
>> https://lore.kernel.org/lkml/10dd2ead-758a-89f0-cda4-70ae927269eb@quicinc.com/
>>
>> [2]
>> https://lore.kernel.org/lkml/CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com/
> 
> Adding the main ARM list to solicit feedback from other silicon
> manufacturers.
> 
> The cover sheet on the v4 patch set is available at:
> https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_mojha@quicinc.com/

I doubt anyone follows the lists, so at least Cc some maintainers.

+Cc Alim, Kukjin, Vignesh, Nishanth, Matthias.

Best regards,
Krzysztof


