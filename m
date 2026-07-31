Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FA1C5516F
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=; b=iXBty9pr5eSviq4ogYfHWXYddu
	w7DNPiVID1hb/wnMan95E7vrdfxbE42mKEf80zZYNg/evwbGz7f1B8N7RBJ9b+sGtbrlgHjt1I8wD
	Y131taLRgyhtYEfzTJGZRiQPUA7qXNjP+4YSBIsYhjNgqaKtlFY4oOLRKT5QI5822vyuejgJd2uqj
	et0mjZxVJj7X9FRapGCsDSy4nIwxCVqeweQlKtJHpatjgKhYy8UIoAhyxjATI1/5zHHlwOnRX+gd5
	hsqTIk0ohxHayG5tmafja2Akm/eKPFlP5Uc8BM+Pjz00rSU7Wr3a0U1GFa8Bpc2cCKSx/gX3yVsYN
	PXn73juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoTR-0000000Cnyj-25hH;
	Fri, 31 Jul 2026 14:44:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRZ-0000000Cm4H-2Hao
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 14:42:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBelda892289
	for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2026 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=; b=o/rNEoJ8Oye8yOuF
	zL6GwiazrXRPiI+uF8nuWoBzc0ZlBjPX+m3pwkU8aGZ46/XUJ/H4BikXVmcxx/8a
	jEJtTz8kgaAQeS52Zv/l9JSSCEbbIvhW0j9P8T9yJyvAMyqO/Z2DKI2wcD58YOx3
	CDUxaim7tmttEvgQKpkJ+bCJ78WZCo0NGeAdCJqqzPktw8/0P3PkedyWGrav8FLr
	0+K8G/YaIQWUya9VPJ1w7TXufpter81WjdDhCP5qMIpCgmDpbwL7IFglq6wc5Xwb
	KQSnDZbRiPz4YaR4NoBTXBLvXTCd8pbwGyHz/HmAOk9lp75Jk/3OuxBrdcGz0S1l
	1WSbdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1x8rn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2026 14:42:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93102454272so18872885a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2026 07:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785508955; x=1786113755; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=ExgOxI+YIyChoVOaeKSIhsgR0C10R9h8mG/4Osq0n8zToPyWrZOUJMoy8co24E3R1C
         E8sQKAM/r+HXPqWbdny6+pXzYytGwC6m4LkM5h4XzMOY1sUyuYP/7U83EBsYHw1n87MT
         gKfZdwuylAGUhJSLxGIa/vlRYEXVtOx/+7ai2x5Qv7YSlnGuUlN6TG1TA4r58fNYQPyu
         yh7uH50kTy2hukIRQL/U4g/YB4q/V8dTMQjXVXfUdyEtTIMB7ixuPYTGUPcY1LdlITmL
         TLqylIQABFnBXxTbm3k9EZMyxstpusU8u1lMWvyPumxgaHVSOBksU3ZEZAp+iCa7W4dc
         sYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508955; x=1786113755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=eTcGFeZLtkbth0sQ8oNcOUj5MzXi9sou8JDpSuhmLGwgzw/3f/e7LneTgil2WNVzPz
         fD2qhGbK7weR7DhMFnjt08BikxcnRtE6qZP3EuDy6aM6rhF8756UT+Q1hrttScHcUVmM
         kEVcUOoVm5oZuyW/jGAhfa7bw4W5mp4KtaFcIZY8F6/jGu7WKv9QW2MpxBqSB9GJDuTc
         mo5xIn5EbSRYLicekxJ89otV9Nwy/B4VZk+VHOCsRl6JAE210sAD5d4uBq4aft8N6O6n
         Z7JcFSuOI2/6G0Cew9j7pEcJU15gC2O6hILl2EtG37c57zML57Hr0hJZsjUSaFlRVc5e
         wkzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqStb9ceFlfoXnFVZaJ2uctmN6RsOMsXvwiBuMkdt4iX0KVmnvyRntn5ActFXSpvui5QegRdK0AJK25iJlBxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQcBexyXowBnFz23KB+pWepfzcDMy4vB32+/MYtUVO9Pr2lCNf
	qGVYL4GR9OqHzSYegVFC7AKa4Z9y+zxcKRG3yr7EQpEwKe+AdgsIXHCEXdLN71uj+mVQwJFZjEs
	9eUlT9RmaQd86/KKmM+A7wKIQvy9VB7ySFO9yhvCaXruH3naeXOeirUv8bRNhLloc8cv5X2k7ni
	c=
X-Gm-Gg: AR+sD11Cp8eIPBXp0iMP3I3bBljKNulvASi1KSBelT7cNbQNK6oH9PfDnqcUdphIvGY
	qrxo6Pox7AQCt5K3YJHDFW63KtdVuPsqLCYDM5qTfBsBzL98Pfv1It048LDbbYVUJrsaBINBT+A
	7G0IvDL0wb5OvGMa9LIfcr0AlmPuBwtZ+i1YueyNh5u7vl/cYy8NVuZKppEcKlLA84deSUtcC/Q
	cWGZ5dmYZc/ZS2pwXd/bXY93WDtH5IIkFOFtre+Yb0YZve9bgIG6WotYY0e3/9PhUrkzriuCamS
	6tb4eD22p21i8CPMshn5v6KF7LQLD7xxNAhHmnmnh50iX3O9XZWuz7/Ssmh/Om18JGcOXXHSdiu
	xHjCmXlkHRihXMtrvBMSh/mV8
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34874985a.1.1785508955184;
        Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34869985a.1.1785508954780;
        Fri, 31 Jul 2026 07:42:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812e3a7dsm1541071fa.32.2026.07.31.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:42:33 -0700 (PDT)
Message-ID: <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
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
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721065413.2306137-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX8pXLRaBHKey5
 qXlTfOXmjV2dNQjyHpJeKiK1v/gVYIkTjI2nxUCPvRd42Do4rYP4rjvP2QlvCPKf3zStN6c+oI3
 sF58zc1v3yCKhjRC8vVEYvNQ23asRSg=
X-Authority-Analysis: v=2.4 cv=GpByPE1C c=1 sm=1 tr=0 ts=6a6cb45c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=7ZmCE17i0x7kTLN8kT8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX+3liOWHmoYeI
 /EJEOaHkpbu0gKKDiQI3WG7RI8/NxkWHScDlPMaceajlHl5aFZDmV03rlSKuHrKgDjp07dDA+as
 V6y5Mugfoo7MZRpOTwtErmjCjc5q6+bG8rNiS9eYvaaPQ7D7kECmCS6RjCgTsaU3lR3jfXr11sH
 zNcmsbqoyNusss6zrvBQAjBZqv5uoWGXRHbGIoR/4wjAt64gk7hvohn8Cg38Lq+pWBTe3pzsQlY
 No+n4h3apMf14wEFzDcTW1k5xt1ClRup9jVe7Z8npfuUVmFKinzl6XJpuHE80roI15VwBqPAcdO
 /g8WTIr7ho2eQpvn4QIEkQQsJEw9+6JOaJigybcTtNtlOPAvEcbhWqxf0bE8M5kjEI0jwGhv+ys
 7I375jkAWIOEMc0a7OA92FXWYPdIUNx1fjiSXRR9T7JozOm6hPwjzu5V3S/UrCffdIMFPeNtbmz
 Tq05wzg7A7Rs867XKjg==
X-Proofpoint-ORIG-GUID: RQu6g72fxfCG48AiIOapLU2UL8clMGfW
X-Proofpoint-GUID: RQu6g72fxfCG48AiIOapLU2UL8clMGfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074237_624415_9B2D757F 
X-CRM114-Status: GOOD (  21.49  )
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

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
> 
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
> 
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

[...]

> +	/*
> +	 * ACPI FW nodes are associated later when device_register() happens.
> +	 * Skip assigning one here to avoid potential conflicts.
> +	 */
> +	if (!is_acpi_node(fwnode)) {
> +		struct fwnode_handle *port;
> +
> +		/*
> +		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
> +		 * or NULL. Passing NULL to device_set_node() clears any associated
> +		 * fwnode. It is effectively a no-op here, since no fwnode has been
> +		 * assigned to the newly created device yet.
> +		 */
> +		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);

This works if the node at the other end of the graph is a
USB hub, e.g. from qcom/lemans-evk.dts:

usb_hub_3_x: hub@2 {
	compatible = "usb5e3,625";
	reg = <2>;

	peer-hub = <&usb_hub_2_x>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@1 {
			reg = <1>;

			usb_hub_3_1: endpoint {
				remote-endpoint = <&hd3ss3220_1_out_ep>;
			};
		};

		port@4 {
			reg = <4>;

			usb_hub_3_4: endpoint {
			};
		};
	};
};

But something I faced when I was poking at USB4 was that dt-bindings
currently assume every controller is effectively single-port and the
of_graph ports under it represent HS/SS lanes, i.e. the entire
"ports" subnode represents a single USB port

I think the solution here would be to do ports {} under the controller
and have every one of them have 2 endpoints (for HS and SS
respectively) - then, each DT-port would correspond to a USB port
(sorta like in the hub case, minus the hubs are split for HS/SS so
they have just a single endpoint under each port)

But that comes with a big breakage, as always..

Konrad

