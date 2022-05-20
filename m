Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31477C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 01:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDUzRJPe5Dpm5qJNxGXbAMQ5PvU44lGsJgJ4FnV1WC8=; b=198YpYoN6S6PSk
	G9/55ZnFmlCIkeu4p+d0qWBlNRJ+S7kgFCOrMtKH4DGDFFMFlF0KVNJVkyKB5r/GSWGR2fzyjskOf
	pU1HKY5dIZwxcOzx1qQh102yxKR2SJfP+qr0B5uN+RR1vogpIMubjptC/f78xO30JT8g5di3R5VNj
	cvmFGDWgm0dv19mP9cpBqNPEoox9NHwXWg886UIXkTNB+Ww4nITpy9U8MLhAzUWfFWn7GnKyj0ry+
	YSJ+CuAkQs8KMIegXWVY2nHNrfFnL8HOqbjElWCUMEEXF8IyiXCNxq7fwXQKt8pwbgT/IIV+t9kWb
	VTRM4LCj4JHZLcrIWbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrrRl-009ySJ-JT; Fri, 20 May 2022 01:28:53 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrrRY-009yM0-VJ
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 01:28:45 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220520012832epoutp039006d3112b928eb4101bfdfce664afe7~wq-B5fVVw2359223592epoutp03-
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 01:28:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220520012832epoutp039006d3112b928eb4101bfdfce664afe7~wq-B5fVVw2359223592epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1653010112;
 bh=twiM4nG0XN/IUozHsDktNZyZ2toUSdhZtbW2WtXJVBc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qiPvgqtBfZ4TLcHEJiO27tGhxsQpdt91F8up45SHy4sqEf+x+Jsoi7r/1u2+3RltH
 RB/4XBSSZZo6rxZtvSNvjn36sqbaeb9/yNLveF6HpaHwpmiSFxIuUFY3Z1w5vbAosJ
 9dOo7E+UGBGPiaNswu5VkZSPHQg7PZywLnQBdKBQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20220520012832epcas1p3e8f58526d0971fc256847bb7086f09e0~wq-BYR-Yo3128131281epcas1p3M;
 Fri, 20 May 2022 01:28:32 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.235]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4L48Hy4C8sz4x9QB; Fri, 20 May
 2022 01:28:30 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 24.1A.10038.EBEE6826; Fri, 20 May 2022 10:28:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220520012830epcas1p11bffd5f9b19f4267232f005a867c176f~wq_-ouLDq1281212812epcas1p11;
 Fri, 20 May 2022 01:28:30 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220520012830epsmtrp24f2ab9b7b0e738784b2b64ff7b023cc4~wq_-naWSn1570315703epsmtrp2j;
 Fri, 20 May 2022 01:28:30 +0000 (GMT)
X-AuditID: b6c32a37-111ff70000002736-4d-6286eebe6e68
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 55.F1.11276.DBEE6826; Fri, 20 May 2022 10:28:29 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220520012829epsmtip29a57e9b7706d44b3d50c22d2bf3ef24b~wq_-LA16Q0122901229epsmtip2F;
 Fri, 20 May 2022 01:28:29 +0000 (GMT)
Subject: Re: [PATCH v25 0/7] soc: mediatek: SVS: introduce MTK SVS
To: Kevin Hilman <khilman@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Roger Lu <roger.lu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Fan Chen
 <fan.chen@mediatek.com>, Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Nishanth
 Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <rex-bc.chen@mediatek.com>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <5a1767dc-ba2d-4de5-d8fe-2f308d3318a9@samsung.com>
Date: Fri, 20 May 2022 10:54:48 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <7hmtfdbcsc.fsf@baylibre.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxTPd++lLW7YS3l9QmDQbYkwHi1Q+HjGObJcnW4kBLcZtRR6B0hp
 ax97RUMd5SHxAZswqAoYYAbCY7YOgQklCAOiLpAONDzUpSjgBJmEgmEza3vdxn+/c87vd875
 nS8fB+fp2L6cXLmGVsklMj5rG9F5MzgirG+5OFNQe8YfrZ9sYKO1ah2B6gZ/dUGWqTUcjW02
 s5BtZhNDw+ZGNnpksmLIaJ20V3suspClcByg1TODAM1dvo2hprvjGPpGH4WebtzB0Oz9EQI9
 by8lUN+t73FU1DvIRhbrVRZ6OXmVQNXFFpddPlRrbSugLujGCarbMMum6o1aythyikWZGgso
 /aiZoM79LaC613VsavjedYxaNQakvnYwLzGHlkhpVSAtz1JIc+XZSfwP0sTviUUxAmGYMA7F
 8gPlknw6iZ+yLzXs/VyZ3TA/8HOJTGtPpUrUan5EcqJKodXQgTkKtSaJTyulMqVIGa6W5Ku1
 8uxwOa2JFwoEkSI7MSMv54HtuLJr55c/97RgOrAZVAY4HEhGQ/2LT8rANg6P7AKwzPaIzQTP
 AZyYXHIpA672wAagcfmIAzsEbb//hTH5XgD1lw4xgmcA3p2uB46CB7kbTpvnWQ7sSVLwl85v
 WQ4STvax4JWGAcJRYJEh0Lxwz0nikkFwYsPqFLuRydBmnsQdmCDfhu0nm5xbeJEH4Gin/hXH
 HY7WzDn7uNr7WCuHnX1w0gdOzdVhDH4DXl+6iDNbm1xhiS6dwSlwybCBMdgDPhm+xmawL1xd
 7nUuCslCAHUL04AJTgM49PgswbCioLnpO8xxPJwMhh09EUw6CHZvXgLM4O1wee20C3NfN1ha
 zGMob0LLw9lXc3fAhpJTrHLAN2yxY9hiwbDFguH/YfWAaAHetFKdn02rhcqo/946S5FvBM6v
 EBLbBaqWVsIHAMYBAwBycL6nG8jXZ/LcpJKvvqZVCrFKK6PVA0BkP3AF7uuVpbD/JblGLIyO
 E0THREZFI2GMkO/j1lJ1S8IjsyUaOo+mlbTqXx3GcfXVYUfSTNKaO/uPH1gI/yiAfKetz/dc
 0Zjp2U/vijruH/yjNaG6Y+gQkeYDrLz9i9RDRe9Kumj+Zt8Nv7UHzSfG3SsON2fvS/izP/Nj
 /0SYES6dj+tcLMA7X48Pruw1Vxd5B/pljPTsFrt/8WJnHVfUNlVQKxbqo/SFOyrSSjXcHyTx
 9XnjK8nlCi4ILS+tarxSPKf38cbJwsKUyMbYmdkLU3v7Zz4s+/Gltb2b6z4Rf7l/TOXnZT7/
 ZE+LjVW5R8N9izdU8lTmUZGAHR0JXWSf2CXvsPRfSw9N3msyHfs0afthz/OZWGiNxw35Z6bf
 Qvybuv084hJutx87uu6/0vo4QLucxyfUORJhCK5SS/4BDb/h95MEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURhGuTPDdChWh4LhoglIXVgSK1Wj16jEqNFJNG4PosaFApOWSJd0
 qAtxqVJEcENFxUrABSNWJdIqa0oNiwiIUtGKCxgtCA9gcGtREKVtTHg7yXfOf18uhQsHiClU
 sjKV1SilKSKST5TVicJmW74cS4gprlmCXEdu8NDPPB2BCuuf+aL2tz9x1DZ8m0TO98MYarQW
 8VCP2YEhk8M+tlblk6g93QbQ91P1AHVfe4qhm69tGDqqn4f6h1ox1Nn1hEDfSo4TqKblEo4y
 LPU81O4oJdGovZRAecfafZcFM3cL7gLmis5GMJWGTh5z1aRlTMYskjEXHWb0TVaCOfMnhql0
 6XhMY0c5xnw3hW7w38ZfksSmJO9hNXNi4/nyD84D6orIfdVVRkwHhsOzgR8F6fnw3scRLBvw
 KSFdDWBXYwvpHULgRVsDng2oMQ6EdXWc1xkAMH3Y6Ot2Aunl8J211+MH0Qx8XHaOdEs4XUvC
 S1UdhLf4jcEfj62Y2yLpaGjt6/AUk+hw+GrIAdwsoGOh02rH3UzQM2HJkZueFybTm2FlkQPz
 OgGw6XI34Wa/sTuOC42eOzgdAUcKXuBeDoZvuwsxL4fB8oF8PAcEGsblhnGJYVxiGJdcBYQR
 hLBqTiFTcBK1RMnuFXNSBadVysSJKoUJeH5EdFQFKDcOimsBRoFaAClcFCQACn2CUJAk3Z/G
 alS7NNoUlqsFUylCFCxoy27aJaRl0lR2N8uqWc3/FaP8puiwVFmOKy8xtHnhJuEas+F+7L6V
 yfszX+RG1Mi1vfZD+R/KsxKuT5tUqnoZd+F8fVqDZR3/uHaLM6zoXfqDdLDC9TzJf6N5QxvY
 2r36a0DE3D9Ppf3FPotDU6iX/SbV4DX74cidR3NGrQ/OxGl4t5cu1K+aJVnTrMc+hS+KEWzt
 /NwiWXDiSQ/cFLT6x2m5qHj0xJ4dorUNvaqT9ISsnlvxJRmgWRwZr1wakzYxYXprnNisQibn
 hL5cSp35iDb7c/K+v9W2zKG8VtGj5pE2l561fK1cnz+oi+qifTLuFKSenaEttMiYeEXdXuHp
 5V0rNecORs8I+fWm6WEa32d7kiqgU0RwcqkkGtdw0n+123gWgAMAAA==
X-CMS-MailID: 20220520012830epcas1p11bffd5f9b19f4267232f005a867c176f
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220519182512epcas1p3020bd4713580c9244f759971b8bd2c3a
References: <20220516004311.18358-1-roger.lu@mediatek.com>
 <CAGXv+5GSdWPZe3fNpBJ_WW0zCL8Skg6fHx9ATxaKU1hyMEt2Ww@mail.gmail.com>
 <7h4k1ndaui.fsf@baylibre.com> <7hy1yzbtb7.fsf@baylibre.com>
 <CAGXv+5GT=3m=pVPwUOWR42BR=emCpBXvvoAiRV7YKt2kEKWdAQ@mail.gmail.com>
 <CGME20220519182512epcas1p3020bd4713580c9244f759971b8bd2c3a@epcas1p3.samsung.com>
 <7hmtfdbcsc.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_182841_418523_9FDFA436 
X-CRM114-Status: GOOD (  34.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Kevin, Chen-Yu,

On 5/20/22 3:25 AM, Kevin Hilman wrote:
> Chen-Yu Tsai <wenst@chromium.org> writes:
> 
>> n Wed, May 18, 2022 at 8:03 AM Kevin Hilman <khilman@kernel.org> wrote:
>>>
>>> Kevin Hilman <khilman@kernel.org> writes:
>>>
>>>> Chen-Yu Tsai <wenst@chromium.org> writes:
>>>>
>>>>> On Mon, May 16, 2022 at 8:43 AM Roger Lu <roger.lu@mediatek.com> wrote:
>>>>>>
>>>>>> The Smart Voltage Scaling(SVS) engine is a piece of hardware
>>>>>> which calculates suitable SVS bank voltages to OPP voltage table.
>>>>>> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
>>>>>> when receiving OPP_EVENT_ADJUST_VOLTAGE.
>>>>>>
>>>>>> 1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
>>>>>> 2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device().
>>>>>> After retrieving subsys device, SVS driver calls device_link_add() to make sure probe/suspend callback priority.
>>>>>>
>>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=25cb20a212a1f989385dfe23230817e69c62bee5
>>>>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=b325ce39785b1408040d90365a6ab1aa36e94f87
>>>>>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.16-next/dts64&id=a8168cebf1bca1b5269e8a7eb2626fb76814d6e2
>>>>>>
>>>>>> Change since v24:
>>>>>> - Rebase to Linux 5.18-rc6
>>>>>> - Show specific fail log in svs_platform_probe() to help catch which step fails quickly
>>>>>> - Remove struct svs_bank member "pd_dev" because all subsys device's power domain has been merged into one node like above [3]
>>>>>>
>>>>>> Test in below environment:
>>>>>> SW: Integration Tree [4] + Thermal patch [5] + SVS v25 (this patchset)
>>>>>> HW: mt8183-Krane
>>>>>>
>>>>>> [4] https://protect2.fireeye.com/v1/url?k=847bae75-e5f0bb43-847a253a-000babff9b5d-0b6f42041b9dea1d&q=1&e=37a26c43-8564-4808-9701-dc76d1ebbb27&u=https%3A%2F%2Fgithub.com%2Fwens%2Flinux%2Fcommits%2Fmt8183-cpufreq-cci-svs-test
>>>>>
>>>>> I've updated my branch to include all the latest versions of the relevant
>>>>> patch series:
>>>>>
>>>>> - anx7625 DPI bus type series v2 (so the display works)
>>>>> - MT8183 thermal series v9 (this seems to have been overlooked by the
>>>>> maintainer)
>>>>> - MTK SVS driver series v25
>>>>> - devfreq: cpu based scaling support to passive governor series v5
>>>>> - MTK CCI devfreq series v4
>>>>> - MT8183 cpufreq series v7
>>>>> - Additional WIP patches for panfrost MTK devfreq
>>>>
>>>> Thanks for preparing an integration branch Chen-Yu.
>>>>
>>>> I'm testing this on mt8183-pumpkin with one patch to add the CCI
>>>> regulator[1], and the defconfig you posted in a previous rev of this
>>>> series, but the CCI driver still causes a fault on boot[2] on my
>>>> platform.
>>>>
>>>> I mentioned in earlier reviews that I think there's potentially a race
>>>> between CCI and SVS loading since they are co-dependent.  My hunch is
>>>> that this is still not being handled properly.
>>>
>>> Ah, actually it's crashing when I try to boot the platform with
>>> `maxcpus=4` on the cmdline (which I have to do because mt8183-pumpkin is
>>> unstable upstream with the 2nd cluster enabled.)

This warning message is printed by 'WARN_ON(cpufreq_passive_unregister_notifier(devfreq))'
on devfreq passive governor. 

If the cpufreq drivers are not probed before of probing cci devfreq driver
with passive governor, passive governor shows this warning message.
Because passive governor with CPUFREQ_PARENT_DEV depends on the cpufreq driver
in order to get 'struct cpufreq_policy'[2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/tree/drivers/devfreq/governor_passive.c?h=devfreq-testing#n339
[2] https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/tree/drivers/devfreq/governor_passive.c?h=devfreq-testing#n282

But, as I knew, this message might not stop the kernel. Just show the warning
message and then return -EPROBE_DEFER error. It means that maybe try to
probe the cci devfreq driver on late time of kernel booting
and then will be working. But, I need the full kernel booting log
and the booting sequence of between cpufreq and cci devfreq driver.

In order to fix your issue, could you share the full booting log?
And if possible, please explain the more detailed something about this.

>>>
>>> The CCI driver should be a bit more robust about detecting
>>> available/online CPUs
>>
>> This all seems to be handled in the devfreq passive governor.
> 
> Well, that's the initial crash.  But the SVS driver will also go through
> its svs_mt8183_banks[] array (including both big & little clusters) and
> try to init SVS, so presumably that will have some problems also if only
> one cluster is enabled.
> 
>> And presumably we'd like to have CCI devfreq running even if just one
>> core was booted.
> 
> Yes, I assume so also.
> 
>> Added Chanwoo for more ideas.
> 
> OK, thanks.
> 
> Kevin


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
