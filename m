Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC37C98302
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=; b=stcc5m3f1PNYtrhdSxa3GRMuie
	TpOS6V1rU/lswOl2XeCxEyw/FbnT18zchdB1a9yhfR50n7IMqOz5E+XNgPyIztYlrJW7waLaRmUsg
	fo955a+VvDrSJyup8oYKlhBQ3SpSr/sQO7CSWKAozRNtlQfMVHv4E5mfDk2ByhyG2twaAQ+ZRn3Ds
	A2h3jv831hrtiwxU3Ziv8vXdf4CBltD7bscGbAA5aIxbQqIO/RO4eLNmqzkFX4+vibQN0Twz1TpjQ
	Pc3DdiUF2i2fKcU3xe92rVtdUrNIPE7qPPSZPxiWZHEzgYMJ4XTjjuX6czoRQH6wLjN9GMEonLqGv
	EHBqoBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NIE-00000008RhI-1Uu8;
	Wed, 23 Sep 2026 13:45:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NIC-00000008RgD-1cN9
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 13:45:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDLq4l3842694
	for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 13:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=; b=NHhZfGytzmWFyCsj
	Zbq1+A+FQqTZC64KnzfYTjTVPG4qQ2PppdfaDev7x8JA0PLgl8xEusRGtaUk2Jnu
	dktSsj6AkBdohfO4tO1sewfq6TnnSSJAfWsSJiulrAuLH1YzPMPiVH1eN1YzL+gr
	rXl5tjJO3b9ESRI7PcAkNumaqBIipyJqWDIi7+ikcMskQZRd0A3wRk2DfxasF1it
	2mcq9TNtRWWuNicMFsLObGoyuSiP7WGMx9NrG7MnL3ooMu+9W0VVVhVHfTo5swQf
	RGt6T1OymuOg3EfZA02+riv6lxDfUWyRTWk+mzOgJ+2ZyLA7Gl/eBGkdBvnXp9gg
	Mxdl+Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbg344-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 13:45:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a760965865so70619137.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171146; x=1790775946; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=;
        b=EMpQR5xlqhAJM9pLB+7fEwJSmv4QeW5aMiPmMcxdlMdHOSCBjOBfEmxmtEvAXIo5a/
         T4glFYc3k3088wRPO7h5byqqkPf3c3849sM9yjBoPhW3EdnN1R0SEEZHeqNckr1kF1DG
         H0K7gjxfjGypB69KYc+RdFDuFBR3R2WVblWo2gFKqoFJwlJxefo3FEyhAG/r+42qHSvO
         QZUEkedj8zmdVuOOAgOtUZTfKaVb8X/1uMnPGyoUQN1JrD/rBylyz5OY5JpR/tEThmdh
         b/XSIQUfz3nWwvaAwW97EzuoA+kR/SrwnARw1XQczXzhNzEhADk0YWCvoAZaC30lF5zy
         P7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171146; x=1790775946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=;
        b=ngcYLAi2Ag1KFO65FQ1es4xL71i/JYZKE7F1+sagtaBdN02uuf6CAPme8HsVvatODF
         lONEpUzEe3A5OXeU8RxC1GwTGYFF5PaqR588vMMMLSKE2E5sPtibBYCqbTaVWmT9hNlg
         2VsEUBDPquXOL3SxuhMPN3jl00ywZYub58O+d+eMOWjkUAsYpTeQI7EJEjNDAeTfOdbq
         XpmexksdvpRRstsqQWehFi8Xk8TqMKFOXAaLLZB7I1pAsautQbJmRMWapiap9WPy7imC
         /bazCPIQCIhLO7AkEBNEV6WHQJ9VQiZWy68yqCmAtGOcl9OjbWxhQQuFhlRIY4T+1LrJ
         CpFA==
X-Forwarded-Encrypted: i=1; AKwUvBx6wHbjxENjXQME04EnOT91RcrdIulNSENAVhSeXgu/3SuwnKO5gPG+4PBYGmD9kEH/v56AMLkLDuevWgwo0A==@lists.infradead.org
X-Gm-Message-State: AFuF++kbqDkXmclXcR/it6Wv4jr5rl3hWFX9t9KWerSftKvr3oaykB0E
	QH7Wlm5euUQLJe+onKiBRs6zyBIu7itKyJOX0FfPDAY52pF6azp/gb1Zg2duWDS2MCh8EjOPhEO
	+u6cmwuASZtOW/tt/VdcmnYGQPvF7BdY6pX50HpLPscvaaCnr2gC3dovHn8XlnG8h69UBFb7B4S
	U=
X-Gm-Gg: AYBFou14ewbAgyY6FxR4dode+OqYLlWEPzD0NBYREMz71Zb8GBzfwx7LcuQ4vOw5NKY
	sy5brNZOEx+HBzybtid0m6P7GXGdW9aGi/360kNdYc8MHUNdbItyMeWzal/F+mIHCUfUaaYUDQq
	NZm1fo/C7DaSO7yNi+nhQhiNKt2ICBsrYAZ8dD53+RuEpi+TSOxKKz/iZATQXNm74jTNaX9H98k
	Ufbr99s9PVpbgMOsX3OHzAkG8gP9sngIrsb07Wn7mvTptp1va6waYXEn0bquV4oY5meRrKWvRDa
	nwrB0EA+UWXwt2Er14fNb2YvIQ7KdICp74qjtskE+eIw5BkrT2mC4LMAMj+z/9ZQ5u9U2DJnLGi
	jkRqSdvb9haqrsyFjTMrl2g==
X-Received: by 2002:a05:6102:5121:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7ac1c454b57mr2548256137.2.1790171146485;
        Wed, 23 Sep 2026 06:45:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7ac1c454b57mr2548220137.2.1790171145961;
        Wed, 23 Sep 2026 06:45:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37478c9sm1722267a12.0.2026.09.23.06.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:45:44 -0700 (PDT)
Message-ID: <32bceb7e-d06b-4537-9d34-91bfe27f4ff7@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: wens@kernel.org
Cc: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
 <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
 <CAGb2v66c8L20yNNmvj6TaQbS7LnqAyuv0tMQfj+0PSjMUcSByA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGb2v66c8L20yNNmvj6TaQbS7LnqAyuv0tMQfj+0PSjMUcSByA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX5aih7duJ3zbP
 47+tgKwOVLxwxmvmT7bsmxB/ZQ+DfykLkIWEFtEV2N4BcseeLLUq5vLwBWcRODT8YVzswbV6tf/
 jlLfR9x+fVaD20JenHgbwp47EHIxXAQ=
X-Proofpoint-GUID: ArtqPzMhMt9GvxXwm8A04lMAbD2B4-ER
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3d80b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7ONEjnSaIfHBpTaVFwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX3DTw5GNrcGUt
 WQSKtOYRDvlBpumNFc4r0mr3G65TNujSUwnqZYOydTTVTohawZA71uBoqRyvuMsSEpt+VwlhNF/
 im1Q6EMp4tzW7NMdGH0q8goKK0ZNYmyvVs2AjlDbcquEByEI799d18w604MNkAFaMB74SwmqUMj
 0n/f+DoQ+zW1uCRPOCgO+f92vTeYf5rZ++03hBVDnVvGIeHl886t8f/69Th0CFaFBttOzznjAmh
 mSFTNcBVdNZdx+aHgVTf7KEc8XSvQdKs21/gnGI6zNBGlh5p30S+rkfvBSqW0wikKWMDgq0LrYZ
 XKOi1DtPYLuwaoGav9MH+G/pNYrQ8qu+k3YP2bbYy11KMaqc7TNF+ujlvBnxNSCXPMlFUYQZ+CO
 3tIiYz3igbeB0UsJWfYWHl0P/brh/v9csPGW+pXU8oYvtxLWrMItOAxblk75NPp/sIgpCLrwg1I
 z3aBdC1J566Gqx+N6uw==
X-Proofpoint-ORIG-GUID: ArtqPzMhMt9GvxXwm8A04lMAbD2B4-ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_064548_543176_4E5317D8 
X-CRM114-Status: GOOD (  29.72  )
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

On 9/4/26 12:30 PM, Chen-Yu Tsai wrote:
> (dug this out of my kernel.org email)
> 
> On Fri, Jul 31, 2026 at 10:44 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
>>> When a USB hub port is connected to a connector in a firmware node
>>> graph, the port itself has a node in the graph.

[...]

>> But something I faced when I was poking at USB4 was that dt-bindings
>> currently assume every controller is effectively single-port and the
>> of_graph ports under it represent HS/SS lanes, i.e. the entire
>> "ports" subnode represents a single USB port
> 
> Which controller is this? AFAIK for xHCI hosts there currently is no
> "ports" node specified in the common usb-hcd.yaml binding. I plan to
> add this separately, as it can already be used for USB A connectors.

DWC3, the qcom flavor specifically (qcom,snps-dwc3)

> The kernel maps every downstream port of the root hub to a separate
> node. On the XHCI it is more complicated because it has two root hubs,
> one for HS and one for SS. I'm not familiar with the hardware specifics
> but they seem to map into one common namespace, so you probably get
> ports 1~8 for HS and then 9~12 for SS. Note the number of ports is
> different. This is just an example from my x86 workstation. And on
> x86 each port is mapped to a different ACPI node.
> 
>> I think the solution here would be to do ports {} under the controller
>> and have every one of them have 2 endpoints (for HS and SS
>> respectively) - then, each DT-port would correspond to a USB port
>> (sorta like in the hub case, minus the hubs are split for HS/SS so
>> they have just a single endpoint under each port)
> 
> But the hardware descriptors actually give two ports, one for HS and one
> for SS. And in the case of dwc3, I suspect that they always come with
> one downstream HS port and (optionally) one downstream SS port. So the
> binding is actually correct, except for the numbering.

Ohh yeah I overlooked the HS/SS port split.. I think you're right!

> I'm looking into the dwc3 case. Changing the numbering might actually
> not break anything. Linux seems to just need one *a* graph connection,
> but doesn't care about the number. I looked through some other projects:
> 
> - FreeBSD doesn't use the OF graph for anything
> - U-boot doesn't use the OF graph for USB
> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use the
>   OF graph for USB
> - coreboot doesn't use the OF graph for anything
> - Zephyr doesn't support dwc3
> - TF-A doesn't use the OF graph for anything
> - EDK2 doesn't support dwc3 and doesn't support OF graph
> - OP-TEE doesn't support dwc3 and doesn't support OF graph
> 
>> But that comes with a big breakage, as always..
> 
> As I mentioned, it probably isn't as large of a breakage.

That's very welcome for a change! Thanks for checking all of them.

Konrad

