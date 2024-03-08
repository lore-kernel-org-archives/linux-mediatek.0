Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13CAC5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyHi9/MigBIRg5aZyIo+L6RPdjUEn2Ih3s7Mk2WHRVA=; b=BNJgju96cMAA7x2PHdE8gvKTAE
	QpHy9RyMpxE4jjholEBpi3SrAoxLt5py7JHRSd44f/y4BeUP8wFM3xxO4h5LpCA2QgCYgjcii2PlR
	kyDo5EJ2tJwhlD/TcMTt+UBN7pOcP4IS/ZwY3O00XWTgsI5x8he5sgXIRJ/cMlSlq1hODrtAy9/9H
	kAijv3NK59G2Qly1blF421lb4PU82oIwjyFICRtGxUGhEtqRFlimRESSMAX5dEXTwV6MUmpxRoSCJ
	ShdVFP+HX9EBZoeb9lHUoimNiB+WPLPgEHEucjCAU9dvVbm8ER2blrn0dn9N9O7+lklMkiQitvHQu
	rlWwdvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riahz-00000009P41-2nMs;
	Fri, 08 Mar 2024 13:56:23 +0000
Received: from outgoing4.flk.host-h.net ([188.40.0.90])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riahv-00000009P0f-3LJN;
	Fri, 08 Mar 2024 13:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=GyHi9/MigBIRg5aZyIo+L6RPdjUEn2Ih3s7Mk2WHRVA=; b=tSTBbVjADXYNGk
	EHoal7ydCLvx+eT45xlkO/RlvZYGN/GyDIKDuUafYYhELNqSb+h/y5Oh3WI55NmKXtPXwuNfZlUmE
	oodFoLPkAFjbXx1EtAzBWYTEmZ5/LL9JMJT4ERgJKr605oif4WWit16/3dtjAY8kZHy/eJXgepSBi
	iAtSnP0jgNEEy+gsoY41SzQPocW0ZJOG+P1n8194gvUFUvKkBBWLT0GtTNJEq8EG8O2KSSxu5P2TE
	tuhmU1DtO+I5AlTXUCQ/pvqpeXS2ZCUDvIcvJXRc9Qyzb904qnU6cWAAY++bwUvAP8OhRKwem2kpB
	bbbe9zIISbBp6rR+K2Tw==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam1-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1riaho-009Xv3-PA; Fri, 08 Mar 2024 15:56:15 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1riahm-0007Fy-RA; Fri, 08 Mar 2024 15:56:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 08 Mar 2024 15:56:10 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] mips: dts: ralink: mt7621: add serial1 and serial2
 nodes
In-Reply-To: <55f6ee5c-84af-4976-a66c-63800f733f8f@arinc9.com>
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
 <20240307190408.23443-3-justin.swartz@risingedge.co.za>
 <55f6ee5c-84af-4976-a66c-63800f733f8f@arinc9.com>
Message-ID: <f88bd12a52875fa6772b4d69991cc0cc@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8V1IGHx95V+LuqAIKp0A7dPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIFDZRrTGv3rxiw9tFrqFSCFNiLZt/QXQnOBRD+jq1HsKsDh/6
 Srgk2K3gr1VBfJbChkYH6fbrypLNrde+UooQVNLReLErukdelEOHUIpaBbp5GdnsN8+UvimwMinK
 0+Txhz2u9qvrL2PODYgMZQApJXOjDLkqunZ9NcY2bHZn7CfFscMZZf3sCkN20I5vMh4akiObI7Kj
 vK7X04QEin24qbfMFd8eGjnYW8aSH5qj4ujh/13psIvqSqJFa1CcANErDW/w69saM9prk3jNnHtn
 nuEt/J9wDZeQfiNOYsLDFBdwYt2XtlLzy7G7T4kla0JNnAWQx3FS11bhwUa9HCIwKB+TroNcRY33
 oNmH4nRQzHQazgY7lmveanvOdQzf6IMJ3345q/s6ySNrGnXycmhg3NKpXjUWRUPmWaYqa98uuB9K
 ZR2tNRPIxp/vINc/oXVULtBcNrQxKZYuPe8bdCyw79zlPbqLQkZr26Lcxdvj8cqI+CogZdOhX7v3
 ClXzrmMENhJLl6MBfhzHVBR0wHQZxzIUka7Uq615Mik1qzcz308HFwsY4DWIzjhTYXUG8GBZhle6
 F/kpBdN+oWjoATjEFDwcaiz0R34rhTN+GTbl4uS+pZovX9cex7Ac4fawcerGI7TrGXpM/B/M0BZd
 PfIU1BX7pZc1sE3vsz58auH/srM2fgZ9JmgLbj7sqoEiwv7LCxIiAE5ODMnmwjvj2589zjbyZCiM
 WpBpW8YvoIIqmZcWhL/r/eFjMjJnMHeiAPOVAT1rE1/vP68Bb4z3v3h3gCdXrv2+9GnNX30LKqXb
 fwFKgm/rnYBl+Mj5KqOl6Jzub/f3QhLRbOgisvi5VU9eNBtgo6zjiatjNO/pnMCjuIvXs/AyV/Ns
 URB/R+FlEHyAzksgfaRvdgw0WK34QWnzHHMcN6qoXPjenLhIOF1oeRYbjF1Hp647mOWoQlc3hL3c
 ZMexQ8VxpTDmnfa+pzT1vTjrWAqX6CaqW6mpuqL4oTR4u/m4iBmYb1/LCV4/EuVHup06w3Vwxf9C
 F7D6LKKRTfdjzQ6YC7Heg3Xf7O1TOd6RcY/MXB8eEq3bCN2QohZvyS03iBmgsz450Kmjd3fGV2rH
 cg9OLgJ5YOxfUpiW0+V+BI7fngshFOJ8BMQh1ij/Ibtf63VNbf0lrvssY+k7AHGi1NevGWTo2+h8
 Lhk4HCeZR7ymlGVRtthBJ2y8A5arx6JItKpFaUNPGMMlvbMX0nyK1NiAJ0y2Qvvn6ds6mor35w4f
 SfHzQbABJfgy21HclcZkPRq7NhoxyMwqi8Q23Rgadfh5T5n5D4OHHpbEIgsllZKWnzc5M5WlNtVJ
 qo05MS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_055619_888439_040152FC 
X-CRM114-Status: GOOD (  10.41  )
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

On 2024-03-08 15:50, Arınç ÜNAL wrote:
> On 7.03.2024 22:04, Justin Swartz wrote:
>> Add serial1 and serial2 nodes to define the existence of
>> the MT7621's second and third UARTs.
>> 
>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>> ---
>>   arch/mips/boot/dts/ralink/mt7621.dtsi | 28 
>> +++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>> 
>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi 
>> b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> index 3ad4e2343..5a89f0b8c 100644
>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> @@ -124,6 +124,34 @@ serial0: serial@c00 {
>>   			pinctrl-0 = <&uart1_pins>;
>>   		};
>>   +		serial1: serial@d00 {
>> +			compatible = "ns16550a";
>> +			reg = <0xd00 0x100>;
>> +			reg-io-width = <4>;
>> +			reg-shift = <2>;
>> +			clocks = <&sysc MT7621_CLK_UART2>;
>> +			interrupt-parent = <&gic>;
>> +			interrupts = <GIC_SHARED 27 IRQ_TYPE_LEVEL_HIGH>;
>> +			no-loopback-test;
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&uart2_pins>;
>> +			status = "disabled";
>> +		};
> 
> I would group this:
> 
> 		serial1: serial@d00 {
> 			compatible = "ns16550a";
> 			reg = <0xd00 0x100>;
> 
> 			reg-io-width = <4>;
> 			reg-shift = <2>;
> 
> 			clocks = <&sysc MT7621_CLK_UART2>;
> 
> 			interrupt-parent = <&gic>;
> 			interrupts = <GIC_SHARED 27 IRQ_TYPE_LEVEL_HIGH>;
> 
> 			no-loopback-test;
> 
> 			pinctrl-names = "default";
> 			pinctrl-0 = <&uart2_pins>;
> 
> 			status = "disabled";
> 		};
> 
> Same goes for patch 2.

Thanks for the example.

Regards
Justin

